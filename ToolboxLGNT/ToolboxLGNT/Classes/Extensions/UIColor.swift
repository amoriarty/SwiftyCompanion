//
//  UIColor.swift
//  ToolboxLGNT
//
//  Created by Émilie Legent on 05/01/2018.
//

import UIKit

public extension UIColor {
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
}
