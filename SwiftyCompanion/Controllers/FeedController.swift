//
//  FeedController.swift
//  SwiftyCompanion
//
//  Created by Alex Legent on 01/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class FeedController: GenericCollectionViewController<FeedCell, UICollectionViewController>, SectionDelegate {
    private var indexPath = IndexPath(item: 0, section: 0)
    weak var sectionController: SectionController?
    private let controllers = [OverviewController(), ProjectsController(), AchievementsController(), PartnershipsController(), SkillsController()]
    override var items: [[UICollectionViewController]]? {
        return [controllers]
    }
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .clear
    }
    
    override func setupCollectionView() {
        super.setupCollectionView()
        guard let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        layout.scrollDirection = .horizontal
        collectionView?.backgroundColor = .clear
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let item = Int(scrollView.contentOffset.x / scrollView.frame.width)
        
        if item != indexPath.item {
            indexPath = IndexPath(item: item, section: 0)
            sectionController?.scroll(at: indexPath)
        }
    }
    
    func didSelectSection(at indexPath: IndexPath) {
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
