//
//  ClipCell.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/3/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import UIKit

final class ClipCell: UICollectionViewCell {
    
    private lazy var videoView = VideoView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelf()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupSelf() {
        backgroundColor = .orange
    }
    
    private func setupSubviews() {
        addSubview(videoView)
        
        NSLayoutConstraint.activate([
            videoView.topAnchor.constraint(equalTo: topAnchor),
            videoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            videoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            videoView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func populate(with clip: Clip) {
        
    }
    
}

extension ClipCell: Reusable {}
