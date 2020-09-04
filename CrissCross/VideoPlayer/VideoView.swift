//
//  VideoView.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/3/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import AVKit
import UIKit

final class VideoView: UIView {
    
    override var isUserInteractionEnabled: Bool {
        get { true }
        set {}
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupSelf() {
        backgroundColor = .random
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didReceiveTap))
        addGestureRecognizer(tapRecognizer)
    }
    
    @objc
    private func didReceiveTap() {
        print("Tapped video")
    }
    
}
