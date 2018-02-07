//
//  PartnershipCell.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 02/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class PartnershipCell: GenericCollectionViewCell<Partnership> {
    var partnership: Partnership? {
        didSet { partnershipName.text = partnership?.name }
    }
    
    private let partnershipName: UILabel = {
        let label = UILabel()
        label.font = .futuraBold(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(partnershipName)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _ = partnershipName.fill(self, constant: 10)
    }
}
