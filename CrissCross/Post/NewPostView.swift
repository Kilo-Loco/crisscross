//
//  NewPostView.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/4/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import AVFoundation
import Combine
import UIKit

final class NewPostView: UIView {
    
    var shouldRecordPublisher = PassthroughSubject<Bool, Never>()
    var actionPublisher = PassthroughSubject<Action, Never>()
    
    private lazy var previewLayer = AVCaptureVideoPreviewLayer()
    
    private lazy var dismissButton = UIButton.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setBackgroundImage(
            UIImage(systemName: "xmark"),
            for: .normal
        )
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private lazy var flipButton = UIButton.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setBackgroundImage(
            UIImage(systemName: "arrow.2.squarepath"),
            for: .normal
        )
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private lazy var flipLabel = UILabel.create {
        $0.text = "Flip"
        $0.textColor = .white
        $0.adjustsFontForContentSizeCategory = true
        $0.font = .preferredFont(forTextStyle: .footnote)
    }
    
    private lazy var recordButton = UIButton.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .red
        $0.layer.cornerRadius = Self.recordButtonDimension / 2
        $0.addTarget(self, action: #selector(shouldBeginRecording), for: .touchDown)
        $0.addTarget(self, action: #selector(shouldStopRecording), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func setupSubviews() {
        addSubviews(
            dismissButton,
            flipButton,
            recordButton
        )
        
        let guide = layoutMarginsGuide
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: guide.topAnchor),
            dismissButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            dismissButton.widthAnchor.constraint(equalToConstant: 44),
            dismissButton.heightAnchor.constraint(equalToConstant: 44),
            
            flipButton.topAnchor.constraint(equalTo: guide.topAnchor),
            flipButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            flipButton.widthAnchor.constraint(equalToConstant: 44),
            flipButton.heightAnchor.constraint(equalToConstant: 44),
            
            recordButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -50),
            recordButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            recordButton.widthAnchor.constraint(equalToConstant: Self.recordButtonDimension),
            recordButton.heightAnchor.constraint(equalToConstant: Self.recordButtonDimension)
        ])
    }
    
    @objc
    private func shouldBeginRecording() {
        shouldRecordPublisher.send(true)
    }
    
    @objc
    private func shouldStopRecording() {
        shouldRecordPublisher.send(false)
    }
    
    @objc
    private func didTapButton(_ sender: UIButton) {
        switch sender {
        case dismissButton: actionPublisher.send(.dismiss)
        case flipButton: actionPublisher.send(.changeCamera)
        default: break
        }
    }
}

extension NewPostView {
    private static let recordButtonDimension: CGFloat = 80
    
    enum Action {
        case changeCamera
        case dismiss
    }
}
