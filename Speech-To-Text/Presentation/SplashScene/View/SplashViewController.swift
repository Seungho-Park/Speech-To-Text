//
//  SplashViewController.swift
//  Speech-To-Text
//
//  Created by 박승호 on 2023/09/09.
//

import Foundation
import UIKit
import AVFoundation
import Speech

class SplashViewController: UIViewController {
    var service: SpeechService? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton(frame: .zero)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("말하기", for: .normal)
        btn.addTarget(self, action: #selector(self.actionBtn(_:)), for: .touchUpInside)
        
        self.view.addSubview(btn)
        NSLayoutConstraint(item: btn, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: btn, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
    }
    
    @objc func actionBtn(_ sender: UIButton) {
        print("1234")
        
        let bf = SFSpeechAudioBufferRecognitionRequest()
        bf.shouldReportPartialResults = true

        service?.startRecording(request: SpeechRequest(shouldReportPartialResults: true), completion: { result in
            switch result {
            case .success(let speech):
                print(speech)
            case .failure(let error):
                print(error)
            }
        })
    }
}
