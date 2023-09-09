//
//  SplashViewController.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/09.
//

import Foundation
import UIKit
import AVFoundation
import Speech

class SplashViewController: UIViewController {
    var service: SpeechService? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
    }
}
