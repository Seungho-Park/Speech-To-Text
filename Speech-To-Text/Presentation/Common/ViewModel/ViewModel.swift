//
//  ViewModel.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/08.
//

import Foundation
import RxSwift

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    var bag: DisposeBag { get }
    
    func transform(input: Input) -> Output
}


extension ViewModel {
    var bag: DisposeBag {
        return DisposeBag()
    }
}
