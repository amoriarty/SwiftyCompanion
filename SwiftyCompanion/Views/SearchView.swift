//
//  SearchView.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 16/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class SearchView: UIView {
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Search"
        label.textAlignment = .center
        label.textColor = .swiftyGray
        label.font = UIFont.futuraBook(ofSize: 34).sizeAdaptedFont
        label.backgroundColor = .purple
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .swiftyBlack
        layer.cornerRadius = 5
        clipsToBounds = true
        
        addSubview(label)
        
        _ = label.fill(.horizontaly, self)
        _ = label.constraint(.top, to: self)
        
        // DEBUG RULES
        _ = label.constraint(dimension: .height, constant: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
