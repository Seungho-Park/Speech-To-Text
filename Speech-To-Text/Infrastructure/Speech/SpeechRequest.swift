//
//  SpeechRequest.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/10.
//

import Foundation
import Speech
import AVFoundation

protocol SpeechRequestable {
    var shouldReportPartialResults: Bool { get }
    
    func request(locale: Locale) throws -> (engine: AVAudioEngine, request: SFSpeechRecognitionRequest)
}

extension SpeechRequestable {    
    func request(locale: Locale) throws -> (engine: AVAudioEngine, request: SFSpeechRecognitionRequest) {
        let engine = AVAudioEngine()
        
        let request = SFSpeechAudioBufferRecognitionRequest()
        request.shouldReportPartialResults = self.shouldReportPartialResults
        
        let session = AVAudioSession.sharedInstance()
        try session.setCategory(.playAndRecord, mode: .measurement, options: .duckOthers)
        try session.setActive(true, options: .notifyOthersOnDeactivation)
        
        let inputNode = engine.inputNode
        let format = inputNode.outputFormat(forBus: .zero)
        
        inputNode.installTap(onBus: .zero, bufferSize: 1024, format: format) { buffer, time in
            request.append(buffer)
        }
        
        engine.prepare()
        try engine.start()
        
        return (engine: engine, request: request)
    }
}

class SpeechRequest: SpeechRequestable {
    let shouldReportPartialResults: Bool
    
    init(shouldReportPartialResults: Bool = true) {
        self.shouldReportPartialResults = shouldReportPartialResults
    }
}
