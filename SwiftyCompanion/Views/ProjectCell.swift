//
//  ProjectCell.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 02/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class ProjectCell: GenericCollectionViewCell<ProjectUser> {
    override var item: ProjectUser? {
        didSet {
            name.text = item?.project.name
            validation.isHidden = true
            mark.text = nil
            
            guard let finalMark = item?.mark else { return }
            guard let validated = item?.validated else { return }
            mark.text = "\(finalMark)"
            validation.isHidden = false
            
            switch validated {
            case true:
                let image = UIImage(named: "DoneIcon")?.withRenderingMode(.alwaysTemplate)
                validation.image = image
                validation.tintColor = .swiftySuccess
                mark.textColor = .swiftySuccess
            case false:
                let image = UIImage(named: "ClearIcon")?.withRenderingMode(.alwaysTemplate)
                validation.image = image
                validation.tintColor = .swiftyWarning
                mark.textColor = .swiftyWarning
            }
        }
    }
    
    private let name: UILabel = {
        let label = UILabel()
        label.font = .futuraBook(ofSize: 14)
        label.textColor = .swiftyLightBlue
        return label
    }()
    
    private let validation: UIImageView = {
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
        addSubview(name)
        addSubview(validation)
        addSubview(mark)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _ = name.fill(.verticaly, self, constant: 10)
        _ = name.constraint(.leading, to: self, constant: 10)
        
        _ = validation.fill(.verticaly, self, constant: 10)
        _ = validation.constraint(.trailing, to: mark, .leading, constant: 5)
        _ = validation.constraint(dimension: .width, constant: 25)
        
        _ = mark.fill(.verticaly, self, constant: 10)
        _ = mark.constraint(.trailing, to: self, constant: 10)
    }
}
