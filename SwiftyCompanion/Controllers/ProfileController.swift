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
    var user: User? {
        didSet { }
    }
    
    private lazy var navigationView: ProfileNavigationView = {
        guard let frame = navigationController?.navigationBar.frame else  { return ProfileNavigationView() }
        let size = CGSize(width: frame.width / 1.5, height: frame.height)
        let origin = CGPoint(x: (size.width / 2) * -1, y: 0)
        let view = ProfileNavigationView(frame: CGRect(origin: origin, size: size))
        view.controller = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupLayouts()
        setupNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setupViews() {
    }
    
    private func setupLayouts() {
    }
    
    private func setupNavBar() {
//        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "LoginBackground"), for: .default)
        
        guard let frame = navigationController?.navigationBar.frame else { return }
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: frame.height))
        titleView.isUserInteractionEnabled = true
        titleView.addSubview(navigationView)
        navigationItem.titleView = titleView
        
//        let button = UIButton(type: .custom)
//        button.setImage(#imageLiteral(resourceName: "LogoWhite"), for: .normal)
//        button.frame = CGRect(x: (frame.width / 2) * -1, y: 0, width: 50, height: frame.height)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    @objc func handleBack() {
        print("handleBack")
        navigationController?.popViewController(animated: true)
    }
}
