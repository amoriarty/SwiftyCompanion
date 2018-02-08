//
//  GradientBar.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 08/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class GradientBar: GenericView {
    private let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.colors = [UIColor.swiftyLightBlue.cgColor, UIColor.swiftyGreen.cgColor]
        return layer
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .clear
        layer.addSublayer(gradientLayer)
    }
    
    func resize() {
        gradientLayer.frame = bounds
    }
}
