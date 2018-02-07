//
//  OverviewCell.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 07/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class OverviewCell: GenericCollectionViewCell<User> {
    private var progressConstraint: NSLayoutConstraint? {
        willSet { progressConstraint?.isActive = false }
    }
    
    override var item: User? {
        didSet {
//            guard let item = item else { return }
            guard let cursus = UserService.shared.getCursusUser() else { return }
            let level = round(cursus.level)
            let percent = cursus.level - level
            
            progressConstraint = progress.constraint(.width, to: self.level, multiplier: CGFloat(percent))
        }
    }
    
    private let level: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.backgroundColor = .swiftyPureBlack
        return view
    }()
    
    private let progress: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.backgroundColor = .swiftyLightBlue
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(level)
        addSubview(progress)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _ = level.fill(.horizontaly, self, constant: 10)
        _ = level.constraint(dimension: .height, constant: 30)
        _ = level.constraint(.top, to: self, constant: 10)
        
        _ = progress.constraint(.leading, to: level)
        _ = progress.constraint(.top, to: level)
        _ = progress.constraint(.height, to: level)
    }
}
