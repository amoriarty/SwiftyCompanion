//
//  ProfileController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 17/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class ProfileController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SectionDelegate {
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    private let navigationView = ProfileNavigationView()
    private let reuseId = "ProfileCell"
    private var indexPath = IndexPath(item: 0, section: 0)
    var user: User? {
        didSet {
            navigationView.user = user
            collectionView.reloadData()
        }
    }
    
    private let feedControllers: [FeedController] = [
        OverviewController(),
        ProjectsController(),
        AchievementsController(),
        ParternshipsController(),
        FeedController(),
        FeedController()
    ]
    
    private lazy var sectionController: SectionController = {
        let layout = UICollectionViewFlowLayout()
        let controller = SectionController(collectionViewLayout: layout)
        controller.sectionDelegate = self
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
        _ = collectionView.constraint(.bottom, to: view)
    }
    
    func handleBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func didSelectSection(at indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let item = Int(scrollView.contentOffset.x / scrollView.frame.width)
        
        if item != indexPath.item {
            indexPath = IndexPath(item: item, section: 0)
            sectionController.scroll(at: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedControllers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! ProfileCell
        let controller = feedControllers[indexPath.item]
        controller.user = user
        controller.collectionView = cell.collectionView
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
