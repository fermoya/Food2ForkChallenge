//
//  RecipesViewModel.swift
//  UserInterface
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation
import Repository
import Domain

class RecipesViewModel: ViewModel {
    
    private let dataStorePager: DataStorePager
    private(set) var recipes: [Recipe] = []
    
    // Observers
    var didObserveNewItems: (() -> Void)?
    var didObserveError: ((Error) -> Void)?
    var didObserveOrderedItems: (() -> Void)?
    
    init(dataStorePager: DataStorePager) {
        self.dataStorePager = dataStorePager
    }
    
    func fetchNewRecipes() {
        dataStorePager.fetchNewItems { [weak self] (result) in
            switch result {
            case .failure(let error):
                self?.didObserveError?(error)
            case .success(let items):
                self?.recipes = items
                self?.didObserveNewItems?()
            }
        }
    }
    
    func sortDidTap() {
        recipes = recipes.sorted()
        didObserveOrderedItems?()
    }
    
}
