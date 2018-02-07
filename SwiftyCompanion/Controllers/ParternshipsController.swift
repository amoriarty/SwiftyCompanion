//
//  ParternshipsController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 02/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class PartnershipsController: GenericCollectionViewController<PartnershipCell, Partnership>, FeedDelegate {
    var user: User? {
        didSet { collectionView?.reloadData() }
    }

    override var items: [[Partnership]]? {
        guard let user = user else { return nil }
        return [user.partnerships]
    }
}

