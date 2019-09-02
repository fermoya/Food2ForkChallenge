//
//  ViewControllerProvider.swift
//  UserInterface
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation

/// Any class implementing this protocol should be able to provide a view controller for navigation
protocol ViewControllerProvider {
    var viewController: UIViewController { get }
}
