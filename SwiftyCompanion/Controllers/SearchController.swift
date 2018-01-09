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
    
    let background: UIImageView = {
        let image = UIImage(named: "LoginBackground")
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let logo: UIImageView = {
        let image = UIImage(named: "LogoWhite")
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(background)
        view.addSubview(logo)
        
        _ = background.fill(view)
        _ = logo.constraint(dimension: .width, constant: 125)
        _ = logo.constraint(.height, to: logo, .width)
        _ = logo.center(.horizontaly, view)
        _ = logo.center(.verticaly, view, multiplier: 0.5)
    }
}

