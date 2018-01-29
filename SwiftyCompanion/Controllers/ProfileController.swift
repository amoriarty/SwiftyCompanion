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
    private let navigationView = ProfileNavigationView()
    private let previewHeight: CGFloat = 200
    private let reuseId = "reuseid"
    private let headerId = "headerid"
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
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationView.controller = self
        setupViews()
        setupLayouts()
        setupCollectionView()
    }
    
    private func setupViews() {
        view.addSubview(background)
        view.addSubview(navigationView)
        view.addSubview(collectionView)
    }
    
    private func setupLayouts() {
        guard let navBarHeight = navigationController?.navigationBar.frame.height else { return }
        let statusBarHeight = UIApplication.shared.statusBarFrame.height

        _ = background.fill(.horizontaly, view)
        _ = background.constraint(.top, to: view)
        _ = background.constraint(dimension: .height, constant: statusBarHeight + navBarHeight)
        
        _ = navigationView.fill(.horizontaly, view)
        _ = navigationView.constraint(.top, to: view.safeAreaLayoutGuide)
        _ = navigationView.constraint(dimension: .height, constant: navBarHeight)
        
        _ = collectionView.fill(.horizontaly, view.safeAreaLayoutGuide)
        _ = collectionView.constraint(.top, to: navigationView, .bottom)
        _ = collectionView.constraint(.bottom, to: view.safeAreaLayoutGuide)
    }
    
    private func setupCollectionView() {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        layout.sectionHeadersPinToVisibleBounds = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseId)
        collectionView.register(PreviewView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionElementKindSectionHeader else { return UICollectionReusableView() }
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard collectionView.contentOffset.y > 0 else {
            return CGSize(width: collectionView.frame.height, height: 44)
        }
        return CGSize(width: collectionView.frame.width, height: previewHeight)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    func handleBack() {
        navigationController?.popViewController(animated: true)
    }
}
