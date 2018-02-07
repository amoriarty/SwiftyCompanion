//
//  ProjectsController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 02/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class ProjectsController: GenericCollectionViewController<ProjectCell, ProjectUser>, FeedDelegate {
    var user: User? {
        didSet { collectionView?.reloadData() }
    }
    
    override var items: [[ProjectUser]]? {
        guard let projects = user?.projectsUser else { return nil }
        let ungoing = projects.filter { $0.status == "in_progress" && $0.project.parent == nil }
        let finished = projects.filter { $0.status == "finished" && $0.project.parent == nil }
        return [ungoing.reversed(), finished.reversed()]
    }
}
