//
//  SearchController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 09/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class SearchController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    private let searchView = SearchView()
    
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
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        view.addSubview(background)
        view.addSubview(logo)
        view.addSubview(searchView)
    }
    
    private func setupLayouts() {
        _ = background.fill(view)
        _ = logo.constraint(dimension: .width, constant: 125)
        _ = logo.constraint(.height, to: logo, .width)
        _ = logo.center(.horizontaly, view)
        _ = logo.center(.verticaly, view, multiplier: 0.5)
        
        _ = searchView.fill(.horizontaly, view, constant: 15)
        _ = searchView.constraint(.top, to: logo, .bottom, constant: 20)
        
        // DEBUG RULES
        _ = searchView.constraint(dimension: .height, constant: 200)
    }
}

