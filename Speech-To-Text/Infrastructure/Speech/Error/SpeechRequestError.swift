//
//  SpeechRequestError.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/09.
//

import Foundation

enum SpeechRequestError: Error {
    case audioSession(error: Error)
    case audioStartError(error: Error)
    case audioEngineNil
    case bufferRequestError
}
