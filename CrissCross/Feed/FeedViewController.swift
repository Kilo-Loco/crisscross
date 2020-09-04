//
//  FeedViewController.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/3/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import UIKit

final class FeedViewController: UIViewController {

    private let feedManager = FeedCollectionViewManager()
    private let ui = FeedView()
    
    override func loadView() {
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        getClips()
    }
    
    private func configure() {
        ui.register(ClipCell.self)
        feedManager.cellForRow = { collectionView, indexPath, clip in
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ClipCell.reuseIdentifier,
                for: indexPath
            )
            
            let clipCell = cell as? ClipCell
            clipCell?.populate(with: clip)
            
            return cell
        }
        ui.bind(to: feedManager)
    }
    
    private func getClips() {
        let clips = Array(0 ..< 20).map { Clip(id: String($0), username: UUID().uuidString, caption: "") }
        feedManager.set(clips)
    }
}
