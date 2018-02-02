//
//  HeaderCell.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 02/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class HeaderCell: BaseCell {
    var section: String? {
        didSet { label.text = section }
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .futuraBold(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        addSubview(label)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _ = label.fill(self, constant: 10)
    }
}
