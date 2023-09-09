//
//  AppDIContainer.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/09.
//

import Foundation


class AppDIContainer {
    lazy var speechService: SpeechService = {
        let config = SpeechConfig(locale: Locale.init(identifier: "ko-KR"))
        let service = DefaultSpeechService(config: config)
        
        return service
    }()
    
    func makeSplashScene()-> SplashViewController {
        let vc = SplashViewController()
        vc.service = speechService
        
        return vc
    }
}
