//
//  SkillCell.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 07/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class SkillCell: GenericCollectionViewCell<Skill> {
    private var progressConstraint: NSLayoutConstraint? {
        willSet { progressConstraint?.isActive = false }
    }
    
    override var item: Skill? {
        didSet {
            guard let ratio = item?.ratio else { return }
            skill.text = item?.name
            progressConstraint = progress.constraint(.width, to: level, multiplier: CGFloat(ratio / 100))
        }
    }
    
    private let skill: UILabel = {
        let label = UILabel()
        label.font = UIFont.futuraBook(ofSize: 14).sizeAdaptedFont
        label.textColor = .black
        return label
    }()
    
    private let level: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 2.5
        view.layer.borderColor = UIColor.swiftyLightBlue.cgColor
        return view
    }()
    
    private let progress: UIView = {
        let view = UIView()
        view.backgroundColor = .swiftyLightBlue
        view.layer.cornerRadius = 2.5
        view.clipsToBounds = true
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(skill)
        addSubview(level)
        addSubview(progress)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _ = skill.fill(.verticaly, self, constant: 10)
        _ = skill.constraint(.leading, to: self, constant: 10)
        
        _ = level.center(.verticaly, self)
        _ = level.constraint(dimension: .height, constant: 5)
        _ = level.constraint(.width, to: self, multiplier: 0.40)
        _ = level.constraint(.trailing, to: self, constant: 10)
        
        _ = progress.constraint(.height, to: level)
        _ = progress.constraint(.leading, to: level)
        _ = progress.constraint(.top, to: level)
    }
}
