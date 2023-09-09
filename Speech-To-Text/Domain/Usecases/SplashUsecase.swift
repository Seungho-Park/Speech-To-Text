//
//  SplashUsecase.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/10.
//

import Foundation

protocol SplashUsecase {
    func fetchPermission()-> Bool
}

class SplashUsecaseImpl: SplashUsecase {
    let repository: SpeechRepository
    
    init(repository: SpeechRepository) {
        self.repository = repository
    }
    
    func fetchPermission() -> Bool {
        return repository.fetchPermission()
    }
}
