//
//  ProjectsController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 02/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class ProjectsController: FeedController {
    private let reuseId = "ProjectCell"
    private let headerId = "HeaderCell"
    private let sections = ["In progress", "Finished"]
    private var projects: [[ProjectUser]] = []
    override var user: User? {
        didSet {
            guard let projectsUser = user?.projectsUser else { return }
            let ungoing = projectsUser.filter({ $0.status == "in_progress" && $0.project.parent == nil })
            let finished = projectsUser.filter({ $0.status == "finished" && $0.project.parent == nil })
            projects = [ungoing.reversed(), finished.reversed()]
        }
    }
    
    override func setupCollectionView() {
        super.setupCollectionView()
        guard let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        layout.sectionHeadersPinToVisibleBounds = true
        collectionView?.register(ProjectCell.self, forCellWithReuseIdentifier: reuseId)
        collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projects[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! ProjectCell
        cell.projectUser = projects[indexPath.section][indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionElementKindSectionHeader else { return UICollectionReusableView() }
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HeaderCell
        header.section = sections[indexPath.section]
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
}
