//
//  SplashRepositoryImpl.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/10.
//

import Foundation
import Speech
import RxSwift

class SpeechRepositoryImpl: SpeechRepository {
    private let speechService: SpeechService
    private let storage: SpeechStorage
    
    init(speechService: SpeechService, storage: SpeechStorage) {
        self.speechService = speechService
        self.storage = storage
    }
    
    func fetchPermission() -> Bool {
        //fetchPermission 후 권한 없으면 Request Permission
        //권한 없으면 Repo -> RequestPermission
        //거절 시 어케 처리할까? 녹음 버튼 누르면 다시 요청, 거절 시 녹음 시작 ㄴㄴ
        //수락 or 권한 있으면 녹음 시작.
        //그럼 권한을 가져오는 함수를 만들지말고 RecordStart일때 권한 있는지랑 요청 한 번에 처리 후 서비스 시작하는 걸로.
        
        //Request Permission
//        SFSpeechRecognizer.requestAuthorization { auth in
//            switch auth {
//            case .authorized: print("auth!")
//            case .denied: print("denied!")
//            case .notDetermined: print("notDetermined!")
//            case .restricted: print("restricted!")
//            }
//        }
        return SFSpeechRecognizer.authorizationStatus() == .authorized
    }
    
    func fetchRecordHistories() -> Observable<[Record]> {
        return Observable<[Record]>.create { [unowned self] observable in
            self.storage.fetchRecords { result in
                switch result {
                case .success(let records):
                    observable.onNext(records)
                    observable.onCompleted()
                case .failure(let error):
                    observable.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
}
