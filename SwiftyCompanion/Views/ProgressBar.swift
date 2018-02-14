//
//  ProgressBar.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 08/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import ToolboxLGNT

class ProgressBar: GenericView {
    private let progress = UIView()
    
    private var progressWidth: NSLayoutConstraint? {
        willSet { progressWidth?.isActive = false }
    }
    
    var progressColor: UIColor = .clear {
        didSet { progress.backgroundColor = progressColor }
    }
    
    var ratio: CGFloat = 0 {
        didSet { progressWidth = progress.constraint(.width, to: self, multiplier: ratio) }
    }
    
    override func setupViews() {
        super.setupViews()
        clipsToBounds = true
        addSubview(progress)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _ = progress.fill(.verticaly, self)
        _ = progress.constraint(.leading, to: self)
    }
}
