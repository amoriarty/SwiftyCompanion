//
//  SkillsController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 07/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class SkillsController: GenericCollectionViewController<SkillCell, Skill> {
    override func setupCollectionView() {
        super.setupCollectionView()
        collectionView?.backgroundColor = .blue
    }
}
