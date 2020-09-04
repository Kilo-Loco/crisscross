//
//  FeedView.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/3/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import UIKit

final class FeedView: UIView {

    private var collectionView: UICollectionView = {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let screen = UIScreen.main.bounds
        
        let layoutGroupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(screen.width),
            heightDimension: .absolute(screen.height)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: layoutGroupSize,
            subitems: [layoutItem]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets.top = -48
        
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .horizontal
        let layout = UICollectionViewCompositionalLayout(section: section, configuration: configuration)
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .yellow
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSelf()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupSelf() {
        backgroundColor = .systemBackground
    }
    
    private func setupSubviews() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func register<Cell: Reusable>(_ cells: Cell.Type...) {
        cells.forEach { self.collectionView.register($0, forCellWithReuseIdentifier: $0.reuseIdentifier) }
    }
    
    func bind(to manager: FeedCollectionViewManager) {
        manager.manage(collectionView)
    }
}
