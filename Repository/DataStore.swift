//
//  DataStore.swift
//  Repository
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation
import Domain

/// Errors that could raise from retrieving the data
public enum DataStoreError: Error, Equatable {
    case unknown(String)
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case internalServerError
    case badGateway
    case unavailable
}

/// Result of retrieving recipes from a DataStore
public typealias RecipesResponse = Result<[Recipe], DataStoreError>

/// Element in charge of managing Domain entities fetching
public protocol DataStore {
    /// Asynchronously fetches recipes given a page
    func fetchRecipes(at page: UInt?, completion: @escaping (RecipesResponse) -> Void)
}
