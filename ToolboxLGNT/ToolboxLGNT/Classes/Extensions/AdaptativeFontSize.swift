//
//  AdaptativeFontSize.swift
//  ToolboxLGNT
//
//  Created by Émilie Legent on 05/01/2018.
//

import UIKit

public extension UIFont {
    public var sizeAdaptedFont: UIFont {
        get {
            guard let originalSize = fontDescriptor.fontAttributes[.size] as? CGFloat else { return self }
            let bounds = UIScreen.main.bounds
            let height = bounds.height > bounds.width ? bounds.height : bounds.width
            var size = originalSize
            
            switch height {
            case 480: size = size * 0.7
            case 568: size = size * 0.8
            case 667: size = size * 0.9
            default: break
            }
            
            return withSize(size)
        }
    }
}
