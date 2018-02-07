//
//  OverviewController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 01/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class OverviewController: GenericCollectionViewController<OverviewCell, Any>, FeedDelegate {
    var user: User?
    
    override func setupCollectionView() {
        super.setupCollectionView()
        collectionView?.backgroundColor = .blue
    }
}