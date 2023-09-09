//
//  AudioEngine.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/09.
//

import Foundation
import Speech
import AVFoundation

protocol SpeechRequestable {
    typealias CompletionHandler = (SFSpeechAudioBufferRecognitionRequest?, AVAudioInputNode?, SpeechRequestError?)-> Void
    var audioEngine: AVAudioEngine? { get }
    var audioBufferReq: SFSpeechAudioBufferRecognitionRequest? { get }
    
    func prepare(completion: @escaping CompletionHandler)
    func reset()
}


class SpeechRequest: SpeechRequestable {
    var audioEngine: AVAudioEngine?
    var audioBufferReq: SFSpeechAudioBufferRecognitionRequest?
    
    init() {
        audioEngine = nil
        audioBufferReq = nil
    }
    
    init(audioEngine: AVAudioEngine, audioBufferReq: SFSpeechAudioBufferRecognitionRequest) {
        self.audioEngine = audioEngine
        self.audioBufferReq = audioBufferReq
    }
    
    func prepare(completion: @escaping CompletionHandler) {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let inputNode = audioEngine?.inputNode else {
                completion(nil, nil, .audioEngineNil)
                return
            }
            
            guard let request = audioBufferReq else {
                completion(nil, nil, .bufferRequestError)
                return
            }
            
            inputNode.installTap(onBus: .zero, bufferSize: 1024, format: inputNode.outputFormat(forBus: .zero)) { buffer, time in
                request.append(buffer)
            }
            
            audioEngine?.prepare()
            try audioEngine?.start()
            
            completion(request, inputNode, nil)
        } catch let error {
            completion(nil, nil, .audioSession(error: error))
        }
    }
    
    func reset() {
        audioEngine?.stop()
        audioBufferReq = nil
    }
}
