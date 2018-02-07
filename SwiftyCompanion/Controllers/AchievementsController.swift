//
//  AchievementsController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 01/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class AchievementsController: GenericCollectionViewController<AchievementCell, Achievement> {
    override func setupCollectionView() {
        super.setupCollectionView()
        collectionView?.backgroundColor = .yellow
    }
}

//class AchievementsController: FeedController {
//    private let reuseId = "AchievementsCell"
//    
//    override func setupCollectionView() {
//        super.setupCollectionView()
//        collectionView?.register(AchievementCell.self, forCellWithReuseIdentifier: reuseId)
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return user?.achievements.count ?? 0
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! AchievementCell
//        cell.achievement = user?.achievements[indexPath.item]
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: 100)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//}

