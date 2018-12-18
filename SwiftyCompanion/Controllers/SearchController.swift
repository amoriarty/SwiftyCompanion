//
//  SearchController.swift
//  SwiftyCompanion
//
//  Created by Alex Legent on 09/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class SearchController: GenericViewController, InputStackDelegate {
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    private let searchView = SearchView()
    private let profileController = ProfileController()
    private var lock = false
    
    // MARK:- Views
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
    
    // MARK:- View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.delegate = self
        APIService.shared.getToken()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchView.gradientBar.resize()
    }
    
    // MARK:- Setups
    override func setupViews() {
        view.addSubview(background)
        view.addSubview(logo)
        view.addSubview(searchView)
    }
    
    override func setupLayouts() {
        var width = view.frame.width < view.frame.height ? view.frame.width : view.frame.height
        width = width > 500 ? 500 : width
        
        _ = background.fill(view)
        _ = logo.constraint(dimension: .width, constant: 125)
        _ = logo.constraint(.height, to: logo, .width)
        _ = logo.center(.horizontaly, view)
        _ = logo.center(.verticaly, view, multiplier: 0.5)
        _ = searchView.center(view.safeAreaLayoutGuide)
        _ = searchView.constraint(dimension: .width, constant: width - 20)
        _ = searchView.constraint(.height, to: searchView, .width, multiplier: 10 / 16)
    }
    
    func handleSearch(_ login: String) {
        guard lock == false else { return }
        lock = true
        
        APIService.shared.getUser(login) { user in
            self.lock = false
            
            guard let user = user else {
                let alert = UIAlertController(title: "User not found", message: "Sorry, but I wasn't able to find the user you're looking for.", preferredStyle: .alert)
                let dismiss = UIAlertAction(title: "Dismiss", style: .cancel, handler: { _ in
                    alert.dismiss(animated: true, completion: nil)
                })
                
                alert.addAction(dismiss)
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            UserService.shared.user = user
            self.navigationController?.pushViewController(self.profileController, animated: true)
        }
    }
}

