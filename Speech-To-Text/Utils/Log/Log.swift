//
//  Logger.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/12.
//

import Foundation

class Log {
    private static var df: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale.current
        df.dateFormat = "HH:mm:ss.SSS"
        return df
    }()
    
    private static func now()-> String {
        return df.string(from: Date())
    }
    
    static func d(_ tag: String, msg: String) {
        print("[Log(🤎) \(now())] \(tag) : \(msg)")
    }
    
    static func i(_ tag: String, msg: String) {
        print("[Log(🩶) \(now())] \(tag) : \(msg)")
    }
    
    static func w(_ tag: String, msg: String) {
        print("[Log(💛) \(now())] \(tag) : \(msg)")
    }
    
    static func e(_ tag: String, msg: String) {
        print("[Log(❤️) \(now())] \(tag) : \(msg)")
    }
}
