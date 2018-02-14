//
//  SearchView.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 16/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import ToolboxLGNT

class SearchView: GenericView {
    private let inputStack = InputStackView()
    let gradientBar = GradientBar()
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
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .swiftyBlack
        layer.cornerRadius = 5
        clipsToBounds = true
        addSubview(label)
        addSubview(gradientBar)
        addSubview(inputStack)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _ = label.center(.horizontaly, self)
        _ = label.constraint(.top, to: self, constant: 10)
        _ = gradientBar.fill(.horizontaly, self)
        _ = gradientBar.constraint(dimension: .height, constant: 7)
        _ = gradientBar.constraint(.top, to: label, .bottom, constant: 10)
        _ = inputStack.fill(.horizontaly, self)
        _ = inputStack.constraint(.top, to: gradientBar, .bottom, constant: 10)
        _ = inputStack.constraint(.bottom, to: self, constant: 10)
    }
}
