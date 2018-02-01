//
//  FeedController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 01/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class FeedController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private var reuseId = "FeedCell"
    var user: User?
    weak var collectionView: UICollectionView? {
        didSet {
            setupCollectionView()
            collectionView?.delegate = self
            collectionView?.dataSource = self
            collectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
    }
    
    func setupCollectionView() {
        collectionView?.backgroundColor = .clear
        collectionView?.register(BaseCell.self, forCellWithReuseIdentifier: reuseId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath)
    }
}
