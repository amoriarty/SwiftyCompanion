//
//  DatasourceCell.swift
//  ToolboxLGNT
//
//  Created by Émilie Legent on 05/01/2018.
//

import UIKit

open class DatasourceCell: UICollectionViewCell {
    open var item: Any?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
    }
    
    open func setupViews() {}
    open func setupLayouts() {}
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
