//
//  CollectionViewManager.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/3/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Combine
import UIKit

class CollectionViewManager<Section: Hashable, Item: Hashable>: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var cellForRow: UICollectionViewDiffableDataSource<Section, Item>.CellProvider?
    
    var selectedItemPublisher = PassthroughSubject<Item, Never>()
    var willDisplayCellPublisher = PassthroughSubject<(cell: UICollectionViewCell, indexPath: IndexPath), Never>()
    var cellDisappearedPublisher = PassthroughSubject<(cell: UICollectionViewCell, indexPath: IndexPath), Never>()
    
    private var collectionView: UICollectionView?
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>?
    
    func manage(_ collectionView: UICollectionView) {
        collectionView.delegate = self

        self.collectionView = collectionView
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { [weak self] in
            self?.cellForRow?($0, $1, $2)
        }
    }
    
    private func apply(_ change: (inout NSDiffableDataSourceSnapshot<Section, Item>) -> Void) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        change(&snapshot)
        dataSource?.apply(snapshot)
    }
    
    func set(_ items: [Item], in section: Section) {
        apply {
            $0.appendSections([section])
            $0.appendItems(items)
        }
    }
    
    func append(_ item: Item, in section: Section) {
        guard var currentSnapshot = dataSource?.snapshot() else { return }
        currentSnapshot.appendItems([item], toSection: section)
        dataSource?.apply(currentSnapshot)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        willDisplayCellPublisher.send((cell, indexPath))
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didEndDisplaying cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        cellDisappearedPublisher.send((cell, indexPath))
    }
}

extension CollectionViewManager where Section == SingleSection {
    func set(_ items: [Item]) {
        self.set(items, in: .main)
    }
    
    func append(_ item: Item) {
        self.append(item, in: .main)
    }
}
