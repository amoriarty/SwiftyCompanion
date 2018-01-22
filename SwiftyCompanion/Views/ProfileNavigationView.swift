//
//  ProfileNavigationView.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 22/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class ProfileNavigationView: UIView {
    weak var controller: ProfileController?
    
//    private lazy var backButton: UIButton = {
//        let image = UIImage(named: "LogoWhite")
//        let button = UIButton(type: .custom)
//        button.setImage(image, for: .normal)
//        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
//        return button
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        
//        addSubview(backButton)
//        _ = backButton.fill(.verticaly, self)
//        _ = backButton.constraint(.leading, to: self, constant: 10)
//        _ = backButton.constraint(dimension: .width, constant: 40)
    }
    
//    @objc func handleBack() {
//        print("handle back")
//        controller?.navigationController?.popViewController(animated: true)
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
