//
//  SectionCell.swift
//  SwiftyCompanion
//
//  Created by Alexandre LEGENT on 1/30/18.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class SectionCell: DatasourceCell {
    override var item: Any? {
        didSet {
            guard let section = item as? String else { return }
            label.text = section
        }
    }
    
    override var isHighlighted: Bool {
        didSet { setTextColor(isHighlighted) }
    }
    
    override var isSelected: Bool {
        didSet { setTextColor(isSelected) }
    }
    
    private let label: UILabel = {
        let label = UILabel()
//        label.backgroundColor = .brown
        label.font = .futuraBold(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(label)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _ = label.fill(self)
    }
    
    private func setTextColor(_ selected: Bool) {
        switch selected {
        case true: label.textColor = .white
        case false: label.textColor = .lightGray
        }
    }
}
