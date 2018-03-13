//
//  OverviewCell.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 07/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class OverviewCell: GenericCollectionViewCell<User> {
    override var item: User? {
        didSet {
            guard let item = item else { return }
            guard let cursus = UserService.shared.getCursusUser() else { return }
            let level = Int(cursus.level)
            let percent = round((cursus.level - Double(level)) * 100)
            
            profileImage.image = nil
            levelProgress.ratio = CGFloat(percent / 100)
            nameLabel.text = item.displayName
            levelLabel.text = "level \(Int(level)) - \(Int(percent))%"
            phoneLabel.text = item.phone ?? "Cellphone unavailable"
            mailLabel.text = item.email
            locationLabel.text = item.location ?? "Unavailable"
            stackOverview.user = item
            ImageService.shared.getImage(at: item.imageUrl) { _, image in
                self.profileImage.image = image
            }
        }
    }
    
    // MARK:- Views
    private let stackOverview = StackOverview()
    
    private let profileImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .black
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        return view
    }()
    
    private let stackInfo: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .futuraBold(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = .futuraBook(ofSize: 14)
        label.textColor = .swiftyLightBlue
        return label
    }()
    
    private let mailLabel: UILabel = {
        let label = UILabel()
        label.font = .futuraBook(ofSize: 14)
        label.textColor = .swiftyLightBlue
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = .futuraBook(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let levelProgress: ProgressBar = {
        let progress = ProgressBar()
        progress.progressColor = .swiftyLightBlue
        progress.backgroundColor = .swiftyPureBlack
        progress.layer.cornerRadius = 5
        return progress
    }()
    
    private let levelLabel: UILabel = {
        let label = UILabel()
        label.font = .futuraBook(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // MARK:- Setups
    override func setupViews() {
        super.setupViews()
        addSubview(profileImage)
        addSubview(stackInfo)
        addSubview(levelProgress)
        addSubview(levelLabel)
        addSubview(stackOverview)
        stackInfo.addArrangedSubview(nameLabel)
        stackInfo.addArrangedSubview(phoneLabel)
        stackInfo.addArrangedSubview(mailLabel)
        stackInfo.addArrangedSubview(locationLabel)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _ = profileImage.constraint(.top, to: self, constant: 10)
        _ = profileImage.constraint(.leading, to: self, constant: 10)
        _ = profileImage.constraint(dimension: .width, constant: 100)
        _ = profileImage.constraint(.height, to: profileImage, .width)
        
        _ = levelProgress.fill(.horizontaly, self, constant: 10)
        _ = levelProgress.constraint(dimension: .height, constant: 30)
        _ = levelProgress.constraint(.top, to: profileImage, .bottom, constant: 5)
        _ = levelLabel.fill(levelProgress)
        
        _ = stackInfo.constraint(.top, to: self, constant: 10)
        _ = stackInfo.constraint(.trailing, to: self, constant: 10)
        _ = stackInfo.constraint(.leading, to: profileImage, .trailing, constant: 10)
        _ = stackInfo.constraint(.bottom, to: levelProgress, .top, constant: 5)
        
        _ = stackOverview.fill(.horizontaly, self)
        _ = stackOverview.constraint(.top, to: levelProgress, .bottom, constant: 10)
        _ = stackOverview.constraint(.bottom, to: self)
    }
}
