//
//  SpeechConfigurable.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/09.
//

import Foundation

protocol SpeechConfigurable {
    var locale: Locale { get }
}

class SpeechConfig: SpeechConfigurable {
    let locale: Locale
    
    init(locale: Locale) {
        self.locale = locale
    }
}
