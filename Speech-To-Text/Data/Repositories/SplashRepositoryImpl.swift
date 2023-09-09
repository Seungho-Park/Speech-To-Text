//
//  SplashRepositoryImpl.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/10.
//

import Foundation
import Speech

class SpeechRepositoryImpl: SpeechRepository {
    private let speechService: SpeechService
    
    init(speechService: SpeechService) {
        self.speechService = speechService
    }
    
    func fetchPermission() -> Bool {
        SFSpeechRecognizer.authorizationStatus() == .authorized
    }
}
