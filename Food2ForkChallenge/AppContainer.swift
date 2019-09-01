//
//  AppContainer.swift
//  Food2ForkChallenge
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import Foundation
import Repository
import UserInterface

final class AppContainer {
    
    private(set) var window = UIWindow(frame: UIScreen.main.bounds)
    private(set) lazy var navigationController = UINavigationController()
    private(set) lazy var repositoryContainer = RepositoryContainer()
    private(set) lazy var userInterfaceContainer = UserInterfaceContainer(navigationController: navigationController, repositoryContainer: repositoryContainer)
    
    init() { }
    
    var rootViewController: UIViewController {
        let viewController = userInterfaceContainer.initialViewController
        navigationController.viewControllers = [viewController]
        navigationController.setNavigationBarHidden(true, animated: false)
        return navigationController
    }
    
    
}
