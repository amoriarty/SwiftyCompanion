//
//  FeedController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 01/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit



class FeedController: GenericCollectionViewController<FeedCell, UICollectionViewController>, SectionDelegate {
    private var indexPath = IndexPath(item: 0, section: 0)
    weak var sectionController: SectionController?
    override var items: [[UICollectionViewController]]? {
        return [[OverviewController(), ProjectsController(), AchievementsController(), ParternshipsController(), SkillsController()]]
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

//class FeedController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    private var reuseId = "FeedCell"
//    var user: User?
//    weak var collectionView: UICollectionView? {
//        didSet {
//            setupCollectionView()
//            collectionView?.delegate = self
//            collectionView?.dataSource = self
//            collectionView?.reloadData()
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .clear
//    }
//
//    func setupCollectionView() {
//        collectionView?.backgroundColor = .clear
//        collectionView?.register(BaseCell.self, forCellWithReuseIdentifier: reuseId)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        return collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath)
//    }
//}

