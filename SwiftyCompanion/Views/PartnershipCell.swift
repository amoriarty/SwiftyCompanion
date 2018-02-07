//
//  PartnershipCell.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 02/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class PartnershipCell: GenericCollectionViewCell<Partnership> {
    override var item: Partnership? {
        didSet { label.text = item?.name }
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .futuraBold(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(label)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _ = label.fill(self, constant: 10)
    }
}
