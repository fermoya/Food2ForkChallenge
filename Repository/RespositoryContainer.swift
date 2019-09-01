//
//  RespositoryContainer.swift
//  Repository
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation

/// Dependency Injection container for the Respository Module
public final class RepositoryContainer {
    
    public var dataStore: DataStore {
        return Food2ForkWebservice()
    }
    
    public init() { }
    
}
