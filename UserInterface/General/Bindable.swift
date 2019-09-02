//
//  Bindable.swift
//  UserInterface
//
//  Created by Fernando Moya de Rivas on 29/08/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation

/// Basic protocol to identify view models
protocol ViewModel: class { }

/// Forces the implementing class to have a View Model and bind to it
protocol Bindable: class {
    
    associatedtype V where V: ViewModel
    var viewModel: V { get }
    
    func bindViewModel()
}
