//
//  NSObject+Utils.swift
//  UserInterface
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation

extension NSObject {
    public class var className: String {
        return String(describing: self)
    }
}
