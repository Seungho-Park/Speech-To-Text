//
//  BaseViewController.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/10.
//

import Foundation
import UIKit

class BaseViewController<T>: UIViewController, ViewModelBindable {
    var TAG: String { String(describing: Self.self) }
    var viewModel: T!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Log.i(TAG, msg: "viewDidLoad()")
        
        setupUI()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Log.i(TAG, msg: "viewWillAppear(animated: \(animated))")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Log.i(TAG, msg: "viewDidAppear(animated: \(animated))")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        Log.i(TAG, msg: "viewWillDisappear(animated: \(animated))")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        Log.i(TAG, msg: "viewDidDisappear(animated: \(animated))")
    }
    
    func setupUI() {
        self.view.clipsToBounds = true
        self.view.backgroundColor = .systemBackground
    }
    
    func setupConstraints() {
        
    }
    
    func bind() {
        
    }
    
    deinit {
        print("\(Self.self): deinit")
    }
}
