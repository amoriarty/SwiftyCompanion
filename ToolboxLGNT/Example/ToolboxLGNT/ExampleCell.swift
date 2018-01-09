//
//  ExampleCell.swift
//  ToolboxLGNT_Example
//
//  Created by Émilie Legent on 05/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import ToolboxLGNT

class HeaderExample: ExampleCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .purple
    }
}

class DifferentExample: ExampleCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .green
    }
}

class ExampleCell: DatasourceCell {
    override var item: Any? {
        didSet { label.text = item as? String }
    }
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        addSubview(label)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _ = label.fill(self)
    }
}
