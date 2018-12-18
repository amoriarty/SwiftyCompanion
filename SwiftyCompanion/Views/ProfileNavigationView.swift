//
//  ProfileNavigationView.swift
//  SwiftyCompanion
//
//  Created by Alex Legent on 22/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class ProfileNavigationView: GenericView {
    var controller: ProfileController?
    var user: User? {
        didSet {
            guard let user = user else { return }
            var titledLogin = "\n"
            
            if let title = user.titles.first {
                titledLogin += title.name.replacingOccurrences(of: "%login", with: user.login, options: .regularExpression)
            } else {
                titledLogin += user.login
            }
            
            let attributed = NSMutableAttributedString(string: user.displayName, attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont.futuraBook(ofSize: 14)
            ])
            
            let attributedLogin = NSAttributedString(string: titledLogin, attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont.futuraBook(ofSize: 12)
            ])
            
            attributed.append(attributedLogin)
            profileText.attributedText = attributed
            profileImage.image = nil
            ImageService.shared.getImage(at: user.imageUrl) { _, image in
                self.profileImage.image = image
            }
        }
    }
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "LogoWhite")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return button
    }()
    
    private let profileImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 34 / 2
        view.backgroundColor = .black
        view.clipsToBounds = true
        return view
    }()
    
    private let profileText: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    
    override func setupViews() {
        backgroundColor = .clear
        addSubview(backButton)
        addSubview(profileImage)
        addSubview(profileText)
    }
    
    override func setupLayouts() {
        _ = backButton.fill(.verticaly, self, constant: 5)
        _ = backButton.constraint(.leading, to: self, constant: 10)
        _ = backButton.constraint(dimension: .width, constant: 34)
        _ = profileText.center(self)
        _ = profileImage.center(.verticaly, self)
        _ = profileImage.constraint(.trailing, to: profileText, .leading, constant: 5)
        _ = profileImage.constraint(dimension: .width, constant: 34)
        _ = profileImage.constraint(.height, to: profileImage, .width)
    }
    
    @objc func handleBack() {
        controller?.handleBack()
    }
}
