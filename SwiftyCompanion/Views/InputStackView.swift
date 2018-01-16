//
//  InputStackView.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 16/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class InputStackView: UIView {
    private let textView = UIView()
    private let buttonView =  UIView()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let inputText: TextField = {
        let text = TextField()
        text.backgroundColor = .swiftyPureBlack
        text.layer.cornerRadius = 5
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.swiftyLightBlue.cgColor
        text.font = UIFont.futuraBook(ofSize: 30).sizeAdaptedFont
        text.textColor = .swiftyGray
        text.attributedPlaceholder = NSAttributedString(string: "login", attributes: [.foregroundColor: UIColor.swiftyDarkGray])
        text.returnKeyType = .search
        text.autocorrectionType = .no
        text.autocapitalizationType = .none
        return text
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .swiftyLightBlue
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = UIFont.futuraBook(ofSize: 28.8).sizeAdaptedFont
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        addSubview(stackView)
        textView.addSubview(inputText)
        buttonView.addSubview(searchButton)
        stackView.addArrangedSubview(textView)
        stackView.addArrangedSubview(buttonView)
    }
    
    private func setupLayouts() {
        _ = stackView.fill(self)
        _ = inputText.fill(.horizontaly, textView, constant: 20)
        _ = inputText.center(.verticaly, textView)
        _ = searchButton.fill(.horizontaly, buttonView, constant: 75)
        _ = searchButton.center(.verticaly, buttonView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
