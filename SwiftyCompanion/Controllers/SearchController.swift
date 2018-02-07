//
//  SearchController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 09/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class SearchController: GenericViewController, InputStackDelegate {
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    private let searchView = SearchView()
    private let profileController = ProfileController()
    private var lock = false
    
    private let background: UIImageView = {
        let image = UIImage(named: "LoginBackground")
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let logo: UIImageView = {
        let image = UIImage(named: "LogoWhite")
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.delegate = self
        APIService.shared.getToken()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchView.setupGradientLayer()
        logo.alpha = view.frame.width > view.frame.height ? 0 : 1
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { _ in
            self.logo.alpha = size.width > size.height ? 0 : 1
        }, completion: nil)
    }
    
    override func setupViews() {
        view.addSubview(background)
        view.addSubview(logo)
        view.addSubview(searchView)
    }
    
    override func setupLayouts() {
        _ = background.fill(view)
        _ = logo.constraint(dimension: .width, constant: 125)
        _ = logo.constraint(.height, to: logo, .width)
        _ = logo.center(.horizontaly, view)
        _ = logo.center(.verticaly, view, multiplier: 0.5)
        
        
        var width = view.frame.width < view.frame.height ? view.frame.width : view.frame.height
        width = width > 500 ? 500 : width
        
        _ = searchView.center(view.safeAreaLayoutGuide)
        _ = searchView.constraint(dimension: .width, constant: width - 20)
        _ = searchView.constraint(.height, to: searchView, .width, multiplier: 10 / 16)
    }
    
    func handleSearch(_ login: String) {
        guard lock == false else { return }
        lock = true
        
        APIService.shared.getUser(login) { user in
            self.lock = false
            
            guard let user = user else { return }
            self.profileController.user = user
            self.navigationController?.pushViewController(self.profileController, animated: true)
        }
    }
}

