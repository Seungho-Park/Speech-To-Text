//
//  SpeechStorage.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/12.
//

import Foundation
import CoreData


protocol SpeechStorage {
    func fetchRecords(completion: @escaping (Result<[Record], Error>)-> Void)
    func saveRecord(record: Record, completion: @escaping (Result<Record, Error>)-> Void)
}
