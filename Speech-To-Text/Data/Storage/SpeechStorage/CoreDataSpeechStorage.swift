//
//  CoreDataSpeechStorage.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/12.
//

import Foundation

final class CoreDataSpeechStorage: SpeechStorage {
    let coreDataStorage: CoreDataStorage
    
    init(coreDataStorage: CoreDataStorage = CoreDataStorage.shared) {
        self.coreDataStorage = coreDataStorage
    }
    
    func fetchRecords(completion: @escaping (Result<[Record], Error>) -> Void) {
        //MARK: - 이것도 Rx로?
        let request = SpeechEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: #keyPath(SpeechEntity.updateDate), ascending: false)]
        
        do {
            let response = try coreDataStorage.persistentContainer.viewContext.fetch(request)
            
            //TODO: toDomain -
            completion(.success(response.map { Record(title: $0.title!, contents: $0.contents ?? "", createDate: $0.createDate!, updateDate: $0.updateDate ?? $0.createDate!) }))
        } catch {
            completion(.failure(error))
        }
    }
    
    func saveRecord(record: Record, completion: @escaping (Result<Record, Error>) -> Void) {
        
    }
}
