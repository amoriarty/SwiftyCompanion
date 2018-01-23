//
//  ProfileController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 17/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
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
        guard let navBarHeight = navigationController?.navigationBar.frame.height else { return }
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        _ = background.fill(.horizontaly, view)
        _ = background.constraint(.top, to: view)
        _ = background.constraint(dimension: .height, constant: statusBarHeight + navBarHeight)
        
        _ = navigationView.fill(.horizontaly, view)
        _ = navigationView.constraint(.bottom, to: background)
        _ = navigationView.constraint(dimension: .height, constant: navBarHeight)
    }
    
    func handleBack() {
        navigationController?.popViewController(animated: true)
    }
}
