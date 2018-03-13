//
//  OverviewController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 01/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class OverviewController: GenericCollectionViewController<OverviewCell, User>, UserServiceDelegate, StackOverviewDelegate {
    override var items: [[User]]? {
        guard let user = UserService.shared.user else { return nil }
        return [[user]]
    }
    
    // MARK:- View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        UserService.shared.add(delegate: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let indexPath = IndexPath(item: 0, section: 0)
        guard let overview = collectionView?.cellForItem(at: indexPath) as? OverviewCell else { return }
        overview.delegate = self
    }
    
    // MARK:- User Service Delegate
    func userDidChange() {
        collectionView?.reloadData()
    }
    
    // MARK:- Stack Overview Delegate
    func handleChangeCursus() {
        guard let user = UserService.shared.user else { return }
        let alert = UIAlertController(title: "Change Cursus", message: "Select a cursus to check", preferredStyle: .actionSheet)
        
        user.cursusUser.forEach({ cursus in
            let action = UIAlertAction(title: cursus.cursus.name, style: .default, handler: { _ in
                UserService.shared.cursus = cursus.cursus
            })
            alert.addAction(action)
        })
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK:- Collection View Delegate
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}
