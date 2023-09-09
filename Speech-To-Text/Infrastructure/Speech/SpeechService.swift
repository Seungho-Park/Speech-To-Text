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
    typealias CompletionHandler = (Result<String, SpeechServiceError>) -> Void
    
    func startRecording(request: SpeechRequestable, completion: @escaping CompletionHandler)
    func stopRecording()
}

class DefaultSpeechService {
    private let recognizer: SpeechRecognizer
    
    private var engine: AVAudioEngine? = nil
    private var task: SFSpeechRecognitionTask? = nil {
        willSet {
            stopRecording()
        }
    }
    
    init(recognizer: SpeechRecognizer) {
        self.recognizer = recognizer
    }
}


extension DefaultSpeechService: SpeechService {
    func startRecording(request: SpeechRequestable, completion: @escaping CompletionHandler) {
        do {
            let request = try request.request()
            task = recognizer.recognitionTask(with: request.request) { [weak self] string, error in
                if let error = error {
                    if case SpeechRecognizerError.complete(let err) = error {
                        self?.stopRecording()
                        request.engine.stop()
                        request.engine.inputNode.removeTap(onBus: .zero)
                        
                        completion(.failure(.complete(error: err)))
                    } else {
                        completion(.failure(.request(error: error)))
                    }
                    
                    return
                }
                
                completion(.success(string ?? ""))
            }
            
            self.engine = request.engine
        } catch let error {
            completion(.failure(.request(error: error)))
        }
    }
    
    func stopRecording() {
        task?.cancel()
        engine?.stop()
        engine = nil
        task = nil
    }
}
