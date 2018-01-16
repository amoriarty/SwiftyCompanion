//
//  TextField.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 16/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class TextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 8)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 8)
    }
}
