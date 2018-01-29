//
//  PreviewView.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 23/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class PreviewView: UICollectionReusableView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
