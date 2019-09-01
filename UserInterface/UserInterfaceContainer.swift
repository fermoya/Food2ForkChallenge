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
    
    private lazy var landingContainer = LandingContainer(recipesContainer: recipesContainer)
    private lazy var recipesContainer = RecipesContainer(navigationController: navigationController, repositoryContainer: repositoryContainer)
    
    private let navigationController: UINavigationController
    private let repositoryContainer: RepositoryContainer
    
    public init(navigationController: UINavigationController, repositoryContainer: RepositoryContainer) {
        self.navigationController = navigationController
        self.repositoryContainer = repositoryContainer
    }
    
    public var initialViewController: UIViewController {
        return landingContainer.viewController
    }
    
}

