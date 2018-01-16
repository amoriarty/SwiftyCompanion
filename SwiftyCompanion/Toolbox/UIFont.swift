//
//  UIFont.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 16/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

extension UIFont {
    static func futura(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "FuturaPT-Light", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func futuraBook(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "FuturaPT-Book", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func futuraBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "FuturaPT-Bold", size: size) ?? .systemFont(ofSize: size)
    }
}
