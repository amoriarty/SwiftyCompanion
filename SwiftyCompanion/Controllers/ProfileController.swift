//
//  ProfileController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 17/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class ProfileController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    private let reuseId = "ProfileCell"
    private let navigationView = ProfileNavigationView()
    var user: User? {
        didSet { navigationView.user = user }
    }
    
    private let sectionController: SectionController = {
        let layout = UICollectionViewFlowLayout()
        let controller = SectionController(collectionViewLayout: layout)
        return controller
    }()
    
    private let background: UIImageView = {
        let image = UIImage(named: "LoginBackground")
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: self.reuseId)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
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
        view.addSubview(collectionView)
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
        
        _ = collectionView.fill(.horizontaly, view.safeAreaLayoutGuide)
        _ = collectionView.constraint(.top, to: sectionController.view, .bottom)
        _ = collectionView.constraint(.bottom, to: view.safeAreaLayoutGuide)
    }
    
    func handleBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! ProfileCell
        cell.backgroundColor = indexPath.item % 2 == 0 ? .green : .purple
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
