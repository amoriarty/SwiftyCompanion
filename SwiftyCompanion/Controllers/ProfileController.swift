//
//  ProfileController.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 17/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    private let previewMaxHeight: CGFloat = 500
    private let previewMinHeight: CGFloat = 55
    private var previewConstraint: NSLayoutConstraint?
    private var previewIsOpen: Bool {
        guard let constraint = previewConstraint else { return true }
        return constraint.constant == previewMaxHeight
    }
    
    var user: User? {
        didSet { }
    }
    
    private let preview: UIImageView = {
        let image = UIImage(named: "LoginBackground")
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let collectionView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let backButton: UIButton = {
        let image = UIImage(named: "LogoWhite")
        let button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupLayouts()
        setupPreviewGesture()
    }
    
    private func setupViews() {
        view.addSubview(preview)
        view.addSubview(collectionView)
        view.addSubview(backButton)
    }
    
    private func setupLayouts() {
        _ = preview.fill(.horizontaly, view)
        _ = preview.constraint(dimension: .height, constant: previewMaxHeight)
        _ = preview.constraint(.top, to: view)
        
        _ = collectionView.fill(.horizontaly, view.safeAreaLayoutGuide)
        _ = collectionView.constraint(.top, to: preview, .bottom)
        _ = collectionView.constraint(.bottom, to: view)
        
        _ = backButton.constraint(dimension: .width, constant: 50)
        _ = backButton.constraint(.height, to: backButton, .width)
        _ = backButton.constraint(.top, to: view.safeAreaLayoutGuide)
        _ = backButton.constraint(.leading, to: view.safeAreaLayoutGuide, constant: 15)
    }
    
    private func setupPreviewGesture() {
        let upGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleUpGesture))
        upGesture.direction = .up
        view.addGestureRecognizer(upGesture)
        
        let downGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleDownGesture))
        downGesture.direction = .down
        view.addGestureRecognizer(downGesture)
    }
    
    @objc func handleBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleUpGesture() {
        print("Gesture Recognize: UP")
    }
    
    @objc func handleDownGesture() {
        print("Gesture Recognize: DOWN")
    }
}
