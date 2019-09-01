//
//  RecipesNavigator.swift
//  UserInterface
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation

class RecipesNavigator: NSObject {
    
    private let navigationController: UINavigationController
    private let viewControllerProvider: ViewControllerProvider
    
    init(navigationController: UINavigationController, viewControllerProvider: ViewControllerProvider) {
        self.viewControllerProvider = viewControllerProvider
        self.navigationController = navigationController
    }
    
    func navigateToRecipes(from view: UIView) {
        let viewController = viewControllerProvider.viewController
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
