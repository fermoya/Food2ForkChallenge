//
//  LandingViewModel.swift
//  UserInterface
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation

class LandingViewModel: ViewModel {
    
    private let recipesNavigator: RecipesNavigator
    
    init(recipesNavigator: RecipesNavigator) {
        self.recipesNavigator = recipesNavigator
    }
    
    func goDidTap(sender view: UIView) {
        recipesNavigator.navigateToRecipes(from: view)
    }
    
}
