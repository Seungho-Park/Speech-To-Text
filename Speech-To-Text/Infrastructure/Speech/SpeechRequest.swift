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
    var audioEngine: AVAudioEngine? { get }
    var audioBufferReq: SFSpeechAudioBufferRecognitionRequest? { get }
    
    func prepare() throws
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
    
    func prepare() throws {
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(.playAndRecord, mode: .measurement, options: .duckOthers)
        try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        
        guard let inputNode = audioEngine?.inputNode else {
            throw SpeechRequestError.audioEngineNil
        }
        
        audioEngine?.prepare()
    }
    
    func reset() {
        audioEngine?.stop()
        audioBufferReq = nil
    }
}
