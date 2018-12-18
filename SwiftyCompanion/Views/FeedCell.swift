//
//  FeedCell.swift
//  SwiftyCompanion
//
//  Created by Alex Legent on 07/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class FeedCell: GenericCollectionViewCell<UICollectionViewController> {
    override var item: UICollectionViewController? {
        willSet { item?.view.removeFromSuperview() }
        didSet {
            guard let item = item else { return }
            addSubview(item.view)
            _ = item.view.fill(self)
        }
    }
}
