//
//  SearchView.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 16/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class SearchView: UIView {
    private let inputStack = InputStackView()
    weak var delegate: InputStackDelegate? {
        didSet { inputStack.delegate = delegate }
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Search"
        label.textAlignment = .center
        label.textColor = .swiftyGray
        label.font = UIFont.futuraBook(ofSize: 34).sizeAdaptedFont
        return label
    }()
    
    private let gradientBar: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .swiftyBlack
        layer.cornerRadius = 5
        clipsToBounds = true
        
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        addSubview(label)
        addSubview(gradientBar)
        addSubview(inputStack)
    }
    
    private func setupLayouts() {
        _ = label.center(.horizontaly, self)
        _ = label.constraint(.top, to: self, constant: 10)

        _ = gradientBar.fill(.horizontaly, self)
        _ = gradientBar.constraint(dimension: .height, constant: 7)
        _ = gradientBar.constraint(.top, to: label, .bottom, constant: 10)
        
        _ = inputStack.fill(.horizontaly, self)
        _ = inputStack.constraint(.top, to: gradientBar, .bottom, constant: 10)
        _ = inputStack.constraint(.bottom, to: self, constant: 10)
    }
    
    func setupGradientLayer() {
        let layer = CAGradientLayer()
        layer.frame = gradientBar.bounds
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.colors = [UIColor.swiftyLightBlue.cgColor, UIColor.swiftyGreen.cgColor]
        gradientBar.layer.addSublayer(layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
