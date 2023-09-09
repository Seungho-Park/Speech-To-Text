//
//  AppCoordinator.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/09.
//

import Foundation
import UIKit

class AppCoordinator {
    let navController: UINavigationController
    let diContainer: AppDIContainer
    
    init(navController: UINavigationController, diContainer: AppDIContainer) {
        self.navController = navController
        self.diContainer = diContainer
    }
    
    func start() {
        navController.pushViewController(diContainer.makeSplashScene(), animated: false)
    }
}
