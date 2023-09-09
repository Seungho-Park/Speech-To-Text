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
    
    func startRecording(request: SpeechRequest)
}

extension SpeechService {
    func startRecording(request: SpeechRequest) {
        request.prepare { audioReq, inputNode, error in
            if let error = error {
                //TODO: Error -
                return
            }
            
            if let audioReq, let inputNode {
                recognizer.recognitionTask(with: audioReq) { result, error in
                    let isFinal = result?.isFinal ?? false
                    
                    if isFinal || error != nil {
                        //TODO: End Recording -
                        request.reset()
                        inputNode.removeTap(onBus: .zero)
                    }
                    
                    if let result {
                        print(result.bestTranscription.formattedString)
                    }
                }
            }
        }
    }
}


class DefaultSpeechService: SpeechService {
    let recognizer: SFSpeechRecognizer
    let config: SpeechConfigurable
    
    init(config: SpeechConfigurable) {
        self.config = config
        recognizer = SFSpeechRecognizer(locale: self.config.locale)!
    }
}
