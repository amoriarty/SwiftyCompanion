//
//  HorizontalController.swift
//  ToolboxLGNT_Example
//
//  Created by Émilie Legent on 05/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import ToolboxLGNT

class HorizontalController: DatasourceController {
    private let items = [
        "https://www.hdwallpapers.in/walls/asteroids_eclipse-wide.jpg",
        "https://www.hdwallpapers.in/walls/minimal_architecture-wide.jpg",
        "https://www.hdwallpapers.in/walls/island_satellite_image-wide.jpg",
        "https://www.hdwallpapers.in/walls/mountains_sunset-wide.jpg"
    ]
    
    override var types: [DatasourceCell.Type] {
        return [HorizontalCell.self]
    }
    
    override func setup(collectionView: UICollectionView) {
        super.setup(collectionView: collectionView)
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        layout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
    }
    
    override func numberOfItems(in section: Int) -> Int {
        return items.count
    }
    
    override func item(at indexPath: IndexPath) -> Any? {
        return items[indexPath.item]
    }
    
    override func sizeForItem(at indexPath: IndexPath) -> CGSize {
        return collectionView?.frame.size ?? .zero
    }
    
    override func lineSpacing(in section: Int) -> CGFloat {
        return 0
    }
    
    override func itemSpacing(in section: Int) -> CGFloat {
        return 0
    }
}
