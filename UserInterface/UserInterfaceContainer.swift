//
//  UserInterfaceContainer.swift
//  UserInterface
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation
import Repository

/// Dependency Injection container for the User Interface module
public final class UserInterfaceContainer {
    
    /// Landing Scene. Displays a Go Button to navigate to next scene
    private lazy var landingContainer = LandingContainer(recipesContainer: recipesContainer)
    
    /// Recipes scene. Shows a list of recipes
    private lazy var recipesContainer = RecipesContainer(navigationController: navigationController, repositoryContainer: repositoryContainer)
    
    /// App's Navigation controller
    private let navigationController: UINavigationController
    
    /// DI container for data fetchers
    private let repositoryContainer: RepositoryContainer
    
    public init(navigationController: UINavigationController, repositoryContainer: RepositoryContainer) {
        self.navigationController = navigationController
        self.repositoryContainer = repositoryContainer
    }
    
    /// Initial view Controller to start the UI
    public var initialViewController: UIViewController {
        return landingContainer.viewController
    }
    
}

