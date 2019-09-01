//
//  Food2ForkWebservice.swift
//  Repository
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation
import Domain
import Alamofire

typealias HttpDataResult = Swift.Result<Data, DataStoreError>

class Food2ForkWebservice: DataStore {
    
    let apiKey = "b1a7e7ab9708119f4107b0b090a76bf3"
    
    func fetchRecipes(at page: UInt? = 1, completion: @escaping (RecipesResponse) -> Void) {
        let page = page ?? 1
        
        let endpoint: Food2ForkEndpoint = .search(apiKey, page)
        get(from: endpoint) { result in
            let recipesResponse = result.map({ (data) -> [Recipe] in
                return try! JSONDecoder().decode(RecipesWrapper.self, from: data).recipes
            })
            
            completion(recipesResponse)
        }
    }
    
    private func get(from endpoint: Food2ForkEndpoint, completion: @escaping (HttpDataResult) -> Void) {
        request(endpoint.url)
            .responseJSON { [weak self] (dataResponse) in
                guard let self = self else { return }
                let result = self.processHttpResponse(dataResponse)
                completion(result)
        }
    }
    
    private func processHttpResponse<T>(_ dataResponse: DataResponse<T>) -> HttpDataResult {
        let error = self.findErrors(in: dataResponse)
        guard error == nil else {
            return .failure(error!)
        }
        guard let data = dataResponse.data else {
            return .failure(.unknown("Empty response"))
        }
        
        return .success(data)
    }
    
    private func findErrors<T>(in dataResponse: DataResponse<T>) -> DataStoreError? {
        guard let error = dataResponse.error else { return nil }
        
        if let httpCode = dataResponse.response?.statusCode {
            return processHttpErrorResponse(with: httpCode)
        } else {
            return .unknown(error.localizedDescription)
        }
        
    }
    
    private func processHttpErrorResponse(with code: Int) -> DataStoreError {
        let error: DataStoreError
        switch code {
        case 400:
            error = .badRequest
        case 401:
            error = .unauthorized
        case 403:
            error = .forbidden
        case 404:
            error = .notFound
        case 500:
            error = .internalServerError
        case 502:
            error = .badGateway
        case 503:
            error = .unavailable
        default:
            error = .unknown("HTTP code \(code)")
        }
        return error
    }
    
}
