//
//  BaseCell.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 01/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
    }
    
    func setupViews() {}
    func setupLayouts() {}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
