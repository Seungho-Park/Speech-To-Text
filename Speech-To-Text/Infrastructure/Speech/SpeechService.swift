//
//  SpeechService.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/09.
//

import Foundation
import AVFoundation
import Speech

protocol SpeechService {
    var recognizer: SFSpeechRecognizer { get }
    var config: SpeechConfigurable { get }
}


class DefaultSpeechService: SpeechService {
    let recognizer: SFSpeechRecognizer
    let config: SpeechConfigurable
    
    init(config: SpeechConfigurable) {
        self.config = config
        recognizer = SFSpeechRecognizer(locale: self.config.locale)!
    }
}
