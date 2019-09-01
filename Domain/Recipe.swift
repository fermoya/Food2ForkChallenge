//
//  Recipe.swift
//  Domain
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation

/// Holds the basic model of a recipe
public struct Recipe {
    public var title: String
    public var imageUrl: String
    
    // This initializer is not automatically generated and able to use for other modules
    public init(title: String, imageUrl: String) {
        self.title = title
        self.imageUrl = imageUrl
    }
}
