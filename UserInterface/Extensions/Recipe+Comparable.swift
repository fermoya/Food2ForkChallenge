//
//  Recipe+Comparable.swift
//  UserInterface
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation
import Domain

extension Recipe: Comparable {
    
    public static func < (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.title < rhs.title
    }
    
    public static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.title == rhs.title && lhs.imageUrl == rhs.imageUrl
    }
    
}
