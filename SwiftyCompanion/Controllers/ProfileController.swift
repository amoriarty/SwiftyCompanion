//
//  ProfileController.swift
//  SwiftyCompanion
//
//  Created by Alex Legent on 17/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class ProfileController: GenericViewController, UserServiceDelegate {
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    private let navigationView = ProfileNavigationView()
    private let sectionController = SectionController()
    private let feedController = FeedController()
    
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
        sectionController.delegate = feedController
        feedController.sectionController = sectionController
        UserService.shared.add(delegate: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sectionController.viewDidAppear(animated)
        navigationView.user = UserService.shared.user
    }
    
    override func setupViews() {
        view.addSubview(background)
        view.addSubview(navigationView)
        view.addSubview(sectionController.view)
        view.addSubview(feedController.view)
    }
    
    override func setupLayouts() {
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
        _ = feedController.view.fill(.horizontaly, view.safeAreaLayoutGuide)
        _ = feedController.view.constraint(.top, to: sectionController.view, .bottom)
        _ = feedController.view.constraint(.bottom, to: view)
    }
    
    func handleBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func userDidChange() {
        navigationView.user = UserService.shared.user
    }
}
