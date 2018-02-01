//
//  AchievementCell.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 01/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class AchievementCell: BaseCell {
    var achievement: Achievement? {
        didSet {
            guard let achievement = achievement else { return }
            guard let url = URL(string: "https://api.intra.42.fr\(achievement.image)") else { return }
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }
    
    private let background: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 3
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.swiftyBorderGray.cgColor
        return view
    }()
    
    private let imageBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .swiftyLightGray
        view.clipsToBounds = true
        return view
    }()
    
    private let webView: UIWebView = {
        let view = UIWebView()
        view.subviews.forEach({ subview in
            subview.isOpaque = false
            subview.backgroundColor = .clear
        })
        view.isOpaque = false
        view.backgroundColor = .clear
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(background)
        background.addSubview(imageBackground)
        imageBackground.addSubview(webView)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _ = background.fill(self, constant: 10)
        
        _ = imageBackground.fill(.verticaly, background, constant: 1)
        _ = imageBackground.constraint(.trailing, to: background, constant: 1)
        _ = imageBackground.constraint(.width, to: background, multiplier: 0.3)
        
        _ = webView.center(imageBackground)
        _ = webView.constraint(dimension: .width, constant: 70)
        _ = webView.constraint(.height, to: webView, .width)
    }
}
