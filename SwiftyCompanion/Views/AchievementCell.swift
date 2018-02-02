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
            let attributed = NSMutableAttributedString(string: achievement.name, attributes: [
                .font: UIFont.futuraBook(ofSize: 16),
                .foregroundColor: UIColor.black
            ])
            
            let attributedDescription = NSAttributedString(string: "\n\(achievement.description)", attributes: [
                .font: UIFont.futuraBold(ofSize: 12),
                .foregroundColor: UIColor.swiftyGray
            ])
            
            attributed.append(attributedDescription)
            textView.attributedText = attributed
            
            
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
    
    private let textView: UITextView = {
        let text = UITextView()
        text.isScrollEnabled = false
        text.isSelectable = false
        text.isEditable = false
        return text
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
        addSubview(textView)
        background.addSubview(imageBackground)
        imageBackground.addSubview(webView)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _ = background.fill(self, constant: 10)
        
        _ = textView.fill(.verticaly, background, constant: 2)
        _ = textView.constraint(.leading, to: background, constant: 2)
        _ = textView.constraint(.trailing, to: imageBackground, .leading, constant: 2)
        
        _ = imageBackground.fill(.verticaly, background, constant: 1)
        _ = imageBackground.constraint(.trailing, to: background, constant: 1)
        _ = imageBackground.constraint(.width, to: background, multiplier: 0.3)
        
        _ = webView.center(imageBackground)
        _ = webView.constraint(dimension: .width, constant: 50)
        _ = webView.constraint(.height, to: webView, .width)
    }
}
