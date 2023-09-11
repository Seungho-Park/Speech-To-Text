//
//  AppCoordinator.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/09.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    var currentScene: UIViewController? = nil
    let diContainer: AppDIContainer
    
    init(window: UIWindow, diContainer: AppDIContainer) {
        self.window = window
        self.diContainer = diContainer
    }
    
    func start() {
        
    }
}
