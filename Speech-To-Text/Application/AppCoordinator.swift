//
//  AppCoordinator.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/09.
//

import Foundation
import UIKit

protocol Coordinator {
    
    func transition(scene: Scene, style: TransitionType, isAnimated: Bool)
    func close(isAnimated: Bool)
}

extension Coordinator {
    
    func transition(scene: Scene, style: TransitionType, isAnimated: Bool) {
        let vc = scene.instantiate()
        
        switch style {
        case .root: break
        
        case .push: break
            
        case .modal: break
        }
    }
    
    func close(isAnimated: Bool) {
        
    }
}

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
