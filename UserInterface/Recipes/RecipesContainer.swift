//
//  RecipesContainer.swift
//  UserInterface
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation
import Repository

/// Dependency Injection container for the Recipes scene
final class RecipesContainer: ViewControllerProvider {
    
    private let navigationController: UINavigationController
    private let repositoryContainer: RepositoryContainer
    
    init(navigationController: UINavigationController, repositoryContainer: RepositoryContainer) {
        self.navigationController = navigationController
        self.repositoryContainer = repositoryContainer
    }
    
    var viewModel: RecipesViewModel {
        return RecipesViewModel(dataStorePager: repositoryContainer.dataStorePager)
    }
    
    var viewController: UIViewController {
        return RecipesViewController(viewModel: viewModel)
    }
    
    var navigator: RecipesNavigator {
        return RecipesNavigator(navigationController: navigationController, viewControllerProvider: self)
    }
    
}
