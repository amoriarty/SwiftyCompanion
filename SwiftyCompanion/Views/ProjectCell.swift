//
//  ProjectCell.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 02/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class ProjectCell: BaseCell {
    var projectUser: ProjectUser? {
        didSet {
            projectName.text = projectUser?.project.name
            validationIcon.isHidden = true
            mark.text = nil
            
            guard let finalMark = projectUser?.mark else { return }
            guard let validated = projectUser?.validated else { return }
            mark.text = "\(finalMark)"
            validationIcon.isHidden = false
            
            switch validated {
            case true:
                let image = UIImage(named: "DoneIcon")?.withRenderingMode(.alwaysTemplate)
                validationIcon.image = image
                validationIcon.tintColor = .swiftySuccess
                mark.textColor = .swiftySuccess
            case false:
                let image = UIImage(named: "ClearIcon")?.withRenderingMode(.alwaysTemplate)
                validationIcon.image = image
                validationIcon.tintColor = .swiftyWarning
                mark.textColor = .swiftyWarning
            }
        }
    }
    
    private let projectName: UILabel = {
        let label = UILabel()
        label.font = .futuraBook(ofSize: 14)
        label.textColor = .swiftyLightBlue
        return label
    }()
    
    private let validationIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.isHidden = true
        return view
    }()
    
    private let mark: UILabel = {
        let label = UILabel()
        label.font = .futuraBold(ofSize: 16)
        label.textAlignment = .right
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(projectName)
        addSubview(validationIcon)
        addSubview(mark)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _ = projectName.fill(.verticaly, self, constant: 10)
        _ = projectName.constraint(.leading, to: self, constant: 10)
        
        _ = validationIcon.fill(.verticaly, self, constant: 10)
        _ = validationIcon.constraint(.trailing, to: mark, .leading, constant: 5)
        _ = validationIcon.constraint(dimension: .width, constant: 25)
        
        _ = mark.fill(.verticaly, self, constant: 10)
        _ = mark.constraint(.trailing, to: self, constant: 10)
    }
}
