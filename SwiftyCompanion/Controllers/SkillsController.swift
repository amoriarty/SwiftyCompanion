//
//  SkillsController.swift
//  SwiftyCompanion
//
//  Created by Alex Legent on 07/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import ToolboxLGNT

class SkillsController: GenericCollectionViewController<SkillCell, Skill>, UserServiceDelegate {
    override var items: [[Skill]]? {
        guard let cursus = UserService.shared.getCursusUser() else { return nil }
        var skills = cursus.skills.sorted(by: { $0.level > $1.level })
        guard let max = skills.first?.level else { return [skills] }
        
        skills = skills.map({ Skill(id: $0.id, name: $0.name, level: $0.level, ratio: $0.level * 100 / max) })
        return [skills]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserService.shared.add(delegate: self)
    }
    
    func userDidChange() {
        collectionView?.reloadData()
    }
}
