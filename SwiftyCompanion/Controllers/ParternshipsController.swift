//
//  ParternshipsController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 02/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class PartnershipsController: GenericCollectionViewController<PartnershipCell, Partnership>, UserServiceDelegate {
    override var items: [[Partnership]]? {
        guard let user = UserService.shared.user else { return nil }
        return [user.partnerships]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserService.shared.add(delegate: self)
    }
    
    func userDidChange() {
        collectionView?.reloadData()
    }
}

