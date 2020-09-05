//
//  NewPostViewController.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/3/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Combine
import SwiftyCam
import UIKit

class NewPostViewController: SwiftyCamViewController {

    private var hudActionToken: AnyCancellable?
    private var recordToken: AnyCancellable?
    
    private let hud = NewPostView.create {
        $0.translatesAutoresizingMaskIntoConstraints = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHud()
        configure()
    }
    
    private func setupHud() {
        view.addSubview(hud)
        hud.frame = view.bounds
    }
    
    private func configure() {
        cameraDelegate = self
        defaultCamera = .front
        audioEnabled = true
        
        hudActionToken = hud.actionPublisher.sink { [weak self] action in
            switch action {
            case .dismiss:
                self?.dismiss(animated: true)
                
            case .changeCamera:
                self?.switchCamera()
            }
        }
        
        recordToken = hud.shouldRecordPublisher.sink { [weak self] shouldRecord in
            if shouldRecord {
                self?.startVideoRecording()
            } else {
                self?.stopVideoRecording()
            }
        }
    }
}

extension NewPostViewController: SwiftyCamViewControllerDelegate {
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFinishProcessVideoAt url: URL) {
        let previewVC = PreviewViewController(videoUrl: url)
        previewVC.modalPresentationStyle = .overFullScreen
        present(previewVC, animated: true)
    }
}
