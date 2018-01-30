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
    private let sectionController = SectionController()
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sectionController.viewDidAppear(animated)
    }
    
    private func setupViews() {
        view.addSubview(background)
        view.addSubview(navigationView)
        view.addSubview(sectionController.view)
    }
    
    private func setupLayouts() {
        guard let navbarHeight = navigationController?.navigationBar.frame.height else { return }

        _ = background.fill(.horizontaly, view)
        _ = background.constraint(.top, to: view)
        _ = background.constraint(.bottom, to: sectionController.view)
        
        _ = navigationView.fill(.horizontaly, view)
        _ = navigationView.constraint(.top, to: view.safeAreaLayoutGuide)
        _ = navigationView.constraint(dimension: .height, constant: navbarHeight)
        
        _ = sectionController.view.fill(.horizontaly, view)
        _ = sectionController.view.constraint(.top, to: navigationView, .bottom)
        _ = sectionController.view.constraint(dimension: .height, constant: 25)
    }
    
    override func setup(collectionView: UICollectionView) {
        super.setup(collectionView: collectionView)
        
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        guard let navbarHeight = navigationController?.navigationBar.frame.height else { return }
        let inset = UIEdgeInsets(top: navbarHeight + sectionController.view.frame.height, left: 0, bottom: 0, right: 0)
        
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .clear
        collectionView.contentInset = inset
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
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
        guard let navbarHeight = navigationController?.navigationBar.frame.height else { return .zero }
        guard let frame = collectionView?.frame else { return .zero }
        return CGSize(width: frame.width, height: frame.height - navbarHeight)
    }
    
    override func lineSpacing(in section: Int) -> CGFloat {
        return 0
    }
}
