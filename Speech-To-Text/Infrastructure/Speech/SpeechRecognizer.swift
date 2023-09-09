//
//  SpeechRecognizer.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/09.
//

import Foundation
import Speech
import AVFoundation

protocol SpeechRecognizer {
    typealias CompletionHandler = (String?, Error?) -> Void
    
    func recognitionTask(with request: SFSpeechRecognitionRequest, completion: @escaping CompletionHandler) -> SFSpeechRecognitionTask?
}

class DefaultSpeechRecognizer: SpeechRecognizer {
    let config: SpeechConfigurable
    
    init(config: SpeechConfigurable) {
        self.config = config
    }
    
    func recognitionTask(with request: SFSpeechRecognitionRequest, completion: @escaping CompletionHandler) -> SFSpeechRecognitionTask? {
        let recognizer = SFSpeechRecognizer(locale: config.locale)
        guard let recognizer = recognizer else {
            completion(nil, SpeechRecognizerError.nilRecognizer)
            return nil
        }
        
        return recognizer.recognitionTask(with: request) { result, error in
            let isFinal = result?.isFinal ?? false
            
            if error != nil || isFinal {
                completion(nil, SpeechRecognizerError.complete(error: error))
            }
            
            if let result {
                completion(result.bestTranscription.formattedString, nil)
            }
        }
    }
}
