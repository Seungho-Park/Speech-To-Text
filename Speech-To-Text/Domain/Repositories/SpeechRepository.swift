//
//  SplashRepository.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/10.
//

import Foundation
import RxSwift

protocol SpeechRepository {
    func fetchPermission()-> Bool
    func fetchRecordHistories()-> Observable<[Record]>
}
