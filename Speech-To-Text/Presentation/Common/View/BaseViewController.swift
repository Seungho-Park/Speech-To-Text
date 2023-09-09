//
//  BaseViewController.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/10.
//

import Foundation
import UIKit

class BaseViewController<T>: UIViewController, ViewModelBindable {
    var viewModel: T!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        self.view.clipsToBounds = true
        self.view.backgroundColor = .systemBackground
    }
    
    func setupConstraints() {
        
    }
    
    func bind() {
        
    }
}
