//
//  SpeechRecognizerMock.swift
//  Speech-To-TextTests
//
//  Created by 박승호 on 2023/09/10.
//

import Foundation
import Speech

struct SpeechRecognizerMock: SpeechRecognizer {
    var speechText: String
    var error: Error?
    
    func recognitionTask(with request: SFSpeechRecognitionRequest, completion: @escaping CompletionHandler) -> SFSpeechRecognitionTask? {
        completion(speechText, error)
        
        return nil
    }
}
