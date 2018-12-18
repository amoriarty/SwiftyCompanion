//
//  SkillCell.swift
//  SwiftyCompanion
//
//  Created by Alex Legent on 07/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import ToolboxLGNT

class SkillCell: GenericCollectionViewCell<Skill> {
    override var item: Skill? {
        didSet {
            guard let ratio = item?.ratio else { return }
            skill.text = item?.name
            levelProgress.ratio = CGFloat(ratio / 100)
        }
    }
    
    private let skill: UILabel = {
        let label = UILabel()
        label.font = UIFont.futuraBook(ofSize: 14).sizeAdaptedFont
        label.textColor = .black
        return label
    }()
    
    private let levelProgress: ProgressBar = {
        let progress = ProgressBar()
        progress.progressColor = .swiftyLightBlue
        progress.layer.cornerRadius = 2.5
        progress.layer.borderWidth = 1
        progress.layer.borderColor = UIColor.swiftyLightBlue.cgColor
        return progress
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(skill)
        addSubview(levelProgress)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _ = skill.fill(.verticaly, self, constant: 10)
        _ = skill.constraint(.leading, to: self, constant: 10)
        _ = levelProgress.center(.verticaly, self)
        _ = levelProgress.constraint(dimension: .height, constant: 5)
        _ = levelProgress.constraint(.width, to: self, multiplier: 0.4)
        _ = levelProgress.constraint(.trailing, to: self, constant: 10)
    }
}
