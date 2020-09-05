//
//  PreviewView.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/4/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Combine
import UIKit

final class PreviewView: UIView {
    
    let actionPublisher = PassthroughSubject<Action, Never>()
    
    private lazy var videoView = VideoView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var backButton = UIButton.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setBackgroundImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        $0.tintColor = .white
    }
    
    private lazy var nextButton = UIButton.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Next", for: .normal)
        $0.backgroundColor = .systemRed
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupSubviews() {
        addSubviews(videoView, backButton, nextButton)
        
        let guide = layoutMarginsGuide
        NSLayoutConstraint.activate([
            videoView.topAnchor.constraint(equalTo: topAnchor),
            videoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            videoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            videoView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: guide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 44),
            backButton.heightAnchor.constraint(equalToConstant: 44),
            
            nextButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            nextButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 44),
            nextButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc
    private func didTapButton(_ sender: UIButton) {
        switch sender {
        case backButton: actionPublisher.send(.back)
        case nextButton: actionPublisher.send(.next)
        default: break
        }
    }
    
    func playVideo(at url: URL) {
        videoView.prepareVideo(at: url)
        videoView.togglePlay(on: true)
    }
}

extension PreviewView {
    enum Action {
        case back
        case next
    }
}
