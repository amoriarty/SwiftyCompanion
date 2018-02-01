//
//  ProfileCell.swift
//  SwiftyCompanion
//
//  Created by Alexandre LEGENT on 1/30/18.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class ProfileCell: BaseCell {
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(collectionView)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _ = collectionView.fill(self)
    }
}
