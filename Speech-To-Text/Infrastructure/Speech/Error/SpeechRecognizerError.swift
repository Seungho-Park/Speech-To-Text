//
//  SpeechRecognizerError.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/10.
//

import Foundation


enum SpeechRecognizerError: Error {
    case nilRecognizer
    case complete(error: Error?)
}
