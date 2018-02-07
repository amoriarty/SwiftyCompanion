//
//  AchievementsController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 01/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class AchievementsController: GenericCollectionViewController<AchievementCell, Achievement>, FeedDelegate {
    var user: User? {
        didSet { collectionView?.reloadData() }
    }
    
    override var items: [[Achievement]]? {
        guard let user = user else { return nil }
        return [user.achievements]
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}
