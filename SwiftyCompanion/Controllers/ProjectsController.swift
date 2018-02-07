//
//  ProjectsController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 02/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class ProjectsController: GenericCollectionViewController<ProjectCell, ProjectUser>, UserServiceDelegate {
    private let headerId = "HeaderID"
    private let headers = ["In progress", "Finished"]
    
    override var items: [[ProjectUser]]? {
        guard let user = UserService.shared.user else { return nil }
        let projects = user.projectsUser
        let ungoing = projects.filter { $0.status == "in_progress" && $0.project.parent == nil }
        let finished = projects.filter { $0.status == "finished" && $0.project.parent == nil }
        return [ungoing.reversed(), finished.reversed()]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserService.shared.add(delegate: self)
    }
    
    override func setupCollectionView() {
        super.setupCollectionView()
        guard let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        layout.sectionHeadersPinToVisibleBounds = true
        collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    func userDidChange() {
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionElementKindSectionHeader else { return UICollectionReusableView() }
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HeaderCell
        header.item = headers[indexPath.section]
        return header
    }
}
