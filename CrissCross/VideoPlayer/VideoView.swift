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
    
    private var looper: AVPlayerLooper?
    private var queuePlayer: AVQueuePlayer?
    private let playerLayer = AVPlayerLayer()
    
    private var isPlaying: Bool {
        queuePlayer?.rate != 0
    }
    
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
        backgroundColor = .black
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didReceiveTap))
        addGestureRecognizer(tapRecognizer)
        
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
        playerLayer.frame = layer.bounds
    }
    
    func prepareVideo(at path: String) {
        let url = URL(fileURLWithPath: path)
        let playerItem = AVPlayerItem(url: url)
        let player = AVQueuePlayer(playerItem: playerItem)
        
        queuePlayer = player
        playerLayer.player = queuePlayer
        
        looper = AVPlayerLooper(player: player, templateItem: playerItem)
    }
    
    @objc
    private func didReceiveTap() {
        togglePlay()
    }
    
    func togglePlay(on: Bool? = nil) {
        if let on = on {
            on ? queuePlayer?.play() : queuePlayer?.pause()
        } else if isPlaying {
            queuePlayer?.pause()
        } else {
            queuePlayer?.play()
        }
    }
    
}
