//
//  Scene.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/10.
//

import Foundation
import UIKit

protocol Scene {
    func instantiate()-> UIViewController
}


enum AppScene: Scene {
    case splash(SplashViewModel)
    case main
    case record
    case detail
    
    func instantiate() -> UIViewController {
        switch self {
        case .splash(let viewModel): return SplashViewController.create(viewModel: viewModel)
        default: return UIViewController.init()
        }
    }
}
