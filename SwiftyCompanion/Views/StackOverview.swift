//
//  StackOverview.swift
//  SwiftyCompanion
//
//  Created by Alexandre LEGENT on 3/13/18.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class StackOverview: GenericView {
    var user: User? {
        didSet {
            guard let user = user else { return }
            guard let cursus = UserService.shared.getCursusUser() else { return }
            cursusLabel.text = cursus.cursus.name
            walletLabel.text = "\(user.wallet) ₳"
            correctionLabel.text = "\(user.correctionPoint)"
            gradeLabel.text = cursus.grade
        }
    }
    
    // MARK:- Views
    private let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .top
        stack.spacing = 10
        return stack
    }()
    
    private let infoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let userStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let cursusInfo: UILabel = {
        let label = UILabel()
        label.text = "Cursus"
        label.textColor = .black
        label.font = .futuraBold(ofSize: 16)
        return label
    }()
    
    private let cursusLabel: UILabel = {
        let label = UILabel()
        label.font = .futura(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let walletInfo: UILabel = {
        let label = UILabel()
        label.text = "Wallet"
        label.font = .futuraBold(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let walletLabel: UILabel = {
        let label = UILabel()
        label.font = .futura(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let correctionInfo: UILabel = {
        let label = UILabel()
        label.text = "Correction Points"
        label.font = .futuraBold(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let correctionLabel: UILabel = {
        let label = UILabel()
        label.font = .futura(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let gradeInfo: UILabel = {
        let label = UILabel()
        label.text = "Grade"
        label.font = .futuraBold(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let gradeLabel: UILabel = {
        let label = UILabel()
        label.font = .futura(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    // MARK:- Setups
    override func setupViews() {
        super.setupViews()
        addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(infoStack)
        horizontalStack.addArrangedSubview(userStack)
        infoStack.addArrangedSubview(cursusInfo)
        userStack.addArrangedSubview(cursusLabel)
        infoStack.addArrangedSubview(walletInfo)
        userStack.addArrangedSubview(walletLabel)
        infoStack.addArrangedSubview(correctionInfo)
        userStack.addArrangedSubview(correctionLabel)
        infoStack.addArrangedSubview(gradeInfo)
        userStack.addArrangedSubview(gradeLabel)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _ = horizontalStack.fill(self, constant: 15)
    }
}
