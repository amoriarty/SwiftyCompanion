//
//  OverviewController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 01/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class OverviewController: GenericCollectionViewController<OverviewCell, User>, UserServiceDelegate {
    override var items: [[User]]? {
        guard let user = UserService.shared.user else { return nil }
        return [[user]]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserService.shared.add(delegate: self)
    }
    
    func userDidChange() {
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}
