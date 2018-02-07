//
//  SkillsController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 07/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class SkillsController: GenericCollectionViewController<SkillCell, Skill>, FeedDelegate {
    var user: User? {
        didSet { collectionView?.reloadData() }
    }
    
    override var items: [[Skill]]? {
        guard let user = user else { return nil }
        var skills = [Skill]()
        
        if let cursus = user.cursusUser.first(where: { $0.cursus.id == 1 }) {
            skills = cursus.skills
        } else if let cursus = user.cursusUser.first {
            skills = cursus.skills
        }
        
        skills = skills.sorted(by: { $0.level > $1.level })
        
        guard let max = skills.first?.level else { return [skills] }
        skills = skills.map({ Skill(id: $0.id, name: $0.name, level: $0.level, ratio: $0.level * 100 / max) })
        
        return [skills]
    }
}
