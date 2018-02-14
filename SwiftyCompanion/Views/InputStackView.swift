//
//  InputStackView.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 16/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import ToolboxLGNT

protocol InputStackDelegate: class {
    func handleSearch(_ login: String)
}

class InputStackView: GenericView, UITextFieldDelegate {
    private let textView = UIView()
    private let buttonView =  UIView()
    weak var delegate: InputStackDelegate?
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var inputText: TextField = {
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
        text.delegate = self
        return text
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .swiftyLightBlue
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = UIFont.futuraBook(ofSize: 28.8).sizeAdaptedFont
        button.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        addSubview(stackView)
        textView.addSubview(inputText)
        buttonView.addSubview(searchButton)
        stackView.addArrangedSubview(textView)
        stackView.addArrangedSubview(buttonView)
    }
    
    override func setupLayouts() {
        _ = stackView.fill(self)
        _ = inputText.fill(.horizontaly, textView, constant: 20)
        _ = inputText.center(.verticaly, textView)
        _ = searchButton.fill(.horizontaly, buttonView, constant: 75)
        _ = searchButton.center(.verticaly, buttonView)
    }
    
    @objc func handleSearch() {
        guard let login = inputText.text, login.count > 0 else { return }
        delegate?.handleSearch(login)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        handleSearch()
        return true
    }
}
