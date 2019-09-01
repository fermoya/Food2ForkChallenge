//
//  DataStorePager.swift
//  Repository
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation
import Domain

public class DataStorePager {
    
    private let dataStore: DataStore
    private var page: UInt = 1
    private var items: [Recipe] = []
    private var isPagingEnabled = true
    
    init(dataStore: DataStore) {
        self.dataStore = dataStore
    }
    
    public func fetchNewItems(completion: @escaping (Result<[Recipe], DataStoreError>) -> Void) {
        guard isPagingEnabled else { return completion(.success(items)) }
        
        dataStore.fetchRecipes(at: page) { [weak self] (result) in
            guard let self = self else { return }
            guard let newItems = try? result.get() else {
                self.isPagingEnabled = false
                if self.items.isEmpty {
                    return completion(result)
                } else { // Last page reached
                    return completion(.success(self.items))
                }
            }
            self.items.append(contentsOf: newItems)
            self.page += 1
            completion(.success(self.items))
        }
        
    }
    
    
}
