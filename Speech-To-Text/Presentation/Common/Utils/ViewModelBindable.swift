//
//  ViewModelBinable.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/10.
//

import Foundation
import UIKit

protocol ViewModelBindable {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    
    func bind()
}

extension ViewModelBindable where Self: UIViewController {
    private mutating func bindViewModel(viewModel: ViewModelType) {
        self.viewModel = viewModel
        self.loadView()
        
        bind()
    }
    
    static func create(viewModel: ViewModelType)-> Self {
        var vc = Self.init()
        vc.bindViewModel(viewModel: viewModel)
        
        return vc
    }
}
