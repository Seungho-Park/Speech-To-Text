//
//  Coordinator.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/12.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var window: UIWindow { get }
    var currentScene: UIViewController? { get set }
    
    func transition(scene: Scene, style: TransitionStyle, animated: Bool)
    func close(animated: Bool)
    func start()
}

extension Coordinator {
    func transition(scene: Scene, style: TransitionStyle, animated: Bool = true) {
        let vc = scene.instantiate()
        
        switch style {
        case .root:
            window.rootViewController = vc
            window.makeKeyAndVisible()
            currentScene = vc.sceneViewController
        case .push:
            guard let navController = currentScene?.navigationController else {
                //TODO: Error -
                return
            }
            
            navController.pushViewController(vc, animated: animated)
            currentScene = navController.sceneViewController
        case .modal:
            currentScene?.present(vc, animated: animated) {
                self.currentScene = vc.sceneViewController
            }
        }
    }
    
    func close(animated: Bool = true) {
        if let presentingVC = currentScene?.presentingViewController {
            currentScene?.dismiss(animated: animated) {
                self.currentScene = presentingVC.sceneViewController
            }
        } else if let navController = currentScene?.navigationController {
            navController.popViewController(animated: animated)
            currentScene = navController.sceneViewController
        } else {
            //TODO: Error -
        }
    }
}
