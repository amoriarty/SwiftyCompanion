//
//  ProfileController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 17/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class ProfileController: DatasourceController {
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    private let navigationView = ProfileNavigationView()
    var user: User? {
        didSet { navigationView.user = user }
    }
    
    private let background: UIImageView = {
        let image = UIImage(named: "LoginBackground")
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationView.controller = self
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        view.addSubview(background)
        view.addSubview(navigationView)
    }
    
    private func setupLayouts() {
        guard let navbarHeight = navigationController?.navigationBar.frame.height else { return }

        _ = background.fill(.horizontaly, view)
        _ = background.constraint(.top, to: view)
        _ = background.constraint(.bottom, to: navigationView)
        
        _ = navigationView.fill(.horizontaly, view)
        _ = navigationView.constraint(.top, to: view.safeAreaLayoutGuide)
        _ = navigationView.constraint(dimension: .height, constant: navbarHeight)
    }
    
    override func setup(collectionView: UICollectionView) {
        super.setup(collectionView: collectionView)
        
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        guard let navbarHeight = navigationController?.navigationBar.frame.height else { return }
        let inset = UIEdgeInsets(top: navbarHeight, left: 0, bottom: 0, right: 0)
        
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .clear
        collectionView.contentInset = inset
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func handleBack() {
        navigationController?.popViewController(animated: true)
    }
    
    // Datasource controller
    override var types: [DatasourceCell.Type] {
        return [ProfileCell.self]
    }
    
    override func numberOfItems(in section: Int) -> Int {
        return 3
    }
    
    override func sizeForItem(at indexPath: IndexPath) -> CGSize {
        return collectionView?.frame.size ?? .zero
    }
}
