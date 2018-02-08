//
//  GenericView.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 08/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class GenericView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
    }
    
    func setupViews() {}
    func setupLayouts() {}
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
