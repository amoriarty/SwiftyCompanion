//
//  OverviewController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 01/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class OverviewCell: GenericCollectionViewCell<Any> {
    
}

class OverviewController: GenericCollectionViewController<OverviewCell, Any> {
    override func setupCollectionView() {
        super.setupCollectionView()
        collectionView?.backgroundColor = .purple
    }
}

//class OverviewController: FeedController {
//    private let reuseId = "OverviewCell"
//
//    override func setupCollectionView() {
//        super.setupCollectionView()
//        collectionView?.register(BaseCell.self, forCellWithReuseIdentifier: reuseId)
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 0
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath)
//        cell.backgroundColor = .blue
//        return cell
//    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 100, height: 100)
//    }
//}

