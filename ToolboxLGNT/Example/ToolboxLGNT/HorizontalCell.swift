//
//  HorizontalCell.swift
//  ToolboxLGNT_Example
//
//  Created by Émilie Legent on 05/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import ToolboxLGNT

class HorizontalCell: DatasourceCell {
    override var item: Any? {
        didSet {
            guard let link = item as? String else { return }
            
            imageView.image = nil
            activityView.startAnimating()
            ImageService.shared.getImage(at: link) { image in
                self.imageView.image = image
                self.activityView.stopAnimating()
            }
        }
    }
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .white
        return view
    }()
    
    private let activityView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.hidesWhenStopped = true
        view.color = .black
        view.startAnimating()
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(imageView)
        addSubview(activityView)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _ = imageView.center(self)
        _ = imageView.fill(.horizontaly, self)
        _ = imageView.constraint(.height, to: imageView, .width, multiplier: 9 / 16)
        
        _ = activityView.center(self)
    }
}
