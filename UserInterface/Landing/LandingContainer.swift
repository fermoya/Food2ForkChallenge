//
//  LandingContainer.swift
//  UserInterface
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation

/// Dependency Injection container for the Landing scene
final class LandingContainer {
    
    private let recipesContainer: RecipesContainer
    
    init(recipesContainer: RecipesContainer) {
        self.recipesContainer = recipesContainer
    }
    
    var viewModel: LandingViewModel {
        return LandingViewModel(recipesNavigator: recipesContainer.navigator)
    }
    
    var viewController: UIViewController {
        return LandingViewController(viewModel: viewModel)
    }
    
}
