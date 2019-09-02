//
//  RecipesWrapper.swift
//  Repository
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation
import Domain

/// Wrapper for the Search Food2Fork API response
struct RecipesWrapper {
    var recipes: [Recipe]
}

extension RecipesWrapper: Decodable { }
