//
//  SplashRepositoryImpl.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/10.
//

import Foundation
import Speech
import CoreData

class SpeechRepositoryImpl: SpeechRepository {
    private let speechService: SpeechService
    private let storage: CoreDataStorage
    
    init(speechService: SpeechService, storage: CoreDataStorage = CoreDataStorage.shared) {
        self.speechService = speechService
        self.storage = storage
    }
    
    func fetchPermission() -> Bool {
        SFSpeechRecognizer.authorizationStatus() == .authorized
    }
    
    func fetchRecordHistories() -> [Record] {
        //PerformBackgroundTask로? 그럼 Completion 넣어야되는데, 아님 Rx로?
        
        let request: NSFetchRequest = SpeechEntity.fetchRequest()
        let result = try! storage.persistentContainer.viewContext.fetch(request)
        return result.map {
            Record(title: $0.title!, contents: $0.contents ?? "", createDate: $0.createDate!, updateDate: $0.updateDate ?? $0.createDate!)
        }
    }
}
