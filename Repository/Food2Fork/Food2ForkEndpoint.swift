//
//  Food2ForkEndpoint.swift
//  Repository
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation

/// Endpoints for the Food2Fork API
enum Food2ForkEndpoint {
    case search(String, UInt)
    
    private var host: String {
        return "https://www.food2fork.com/api/search"
    }
    
    /* Even if there is just one endpoint, a `switch` is used so that
       errors show up when a new endpoint is added */
    private var path: String {
        switch self {
        case .search:
            return "/search"
        }
    }
    
    private var queryItems: String {
        switch self {
        case .search(let apiKey, let page):
            return "key=\(apiKey)&page=\(page)"
        }
    }
    
    var url: String {
        return host + path + "?" + queryItems
    }
    
}
