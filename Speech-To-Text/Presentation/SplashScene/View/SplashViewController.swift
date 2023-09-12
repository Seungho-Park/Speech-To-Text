//
//  SplashViewController.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/09.
//

import Foundation
import UIKit

class SplashViewController: BaseViewController<SplashViewModel> {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = SplashUsecaseImpl(repository: SpeechRepositoryImpl(speechService: DefaultSpeechService(recognizer: DefaultSpeechRecognizer(config: SpeechConfig(locale: .current)))))
        
        a.fetchPermission()
    }
    
    override func bind() {
        super.bind()
    }
}
