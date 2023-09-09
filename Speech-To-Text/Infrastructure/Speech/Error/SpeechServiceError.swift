//
//  SpeechServiceError.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/09.
//

import Foundation

enum SpeechServiceError: Error {
    case request(error: Error)
    case complete(error: Error?)
}
