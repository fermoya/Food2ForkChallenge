//
//  Recipe+Decodable.swift
//  Repository
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation
import Domain

extension Recipe: Decodable {

    // This implementation is necessary as Recipe belongs to a different module and XCode is not able to do it by itself
    
    private enum CodingKeys: String, CodingKey {
        case title, imageUrl = "image_url"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        
        let title = try! container.decode(String.self, forKey: .title)
        let imageUrl = try! container.decode(String.self, forKey: .imageUrl)
        
        self.init(title: title, imageUrl: imageUrl)
    }
    
}
