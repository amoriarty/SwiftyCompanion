//
//  ViewController.swift
//  ToolboxLGNT
//
//  Created by amoriarty on 01/05/2018.
//  Copyright (c) 2018 amoriarty. All rights reserved.
//

import UIKit
import ToolboxLGNT

class ViewController: UIViewController {
    private let collectionViewController = CollectionViewController()
    
    private let centeredView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let fillingView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let coloredView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 255, g: 0, b: 255, a: 0.4)
        return view
    }()
    
    private let labelView: UILabel = {
        let label = UILabel()
        label.text = "Quis tenetur incidunt natus. Magnam iste quisquam aut sunt nulla ex consequatur nam. Architecto voluptate impedit deserunt quas. Doloremque dolore qui eius laborum deleniti et. Consequuntur consequatur molestiae unde aliquam asperiores sint quia incidunt. Voluptate voluptates enim a maiores quia."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let adaptativeLabel: UILabel = {
        let label = UILabel()
        label.text = "A"
        label.font = UIFont.systemFont(ofSize: 50).sizeAdaptedFont
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
        setupRegex()
        
        let nextButton = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(handleNext))
        navigationItem.rightBarButtonItem = nextButton
    }
    
    private func setupViews() {
        view.addSubview(coloredView)
        view.addSubview(centeredView)
        view.addSubview(fillingView)
        view.addSubview(labelView)
        view.addSubview(adaptativeLabel)
    }
    
    private func setupLayouts() {
        _ = coloredView.fill(view)
        
        _ = labelView.constraint(.top, to: view.safeAreaLayoutGuide, constant: 10)
        _ = labelView.fill(.horizontaly, view.safeAreaLayoutGuide, constant: 10)
        
        _ = centeredView.constraint(dimension: .height, constant: 100)
        _ = centeredView.constraint(.width, to: centeredView, .height)
        _ = centeredView.center(view.safeAreaLayoutGuide)
        
        _ = fillingView.fill(.horizontaly, view.safeAreaLayoutGuide)
        _ = fillingView.constraint(.top, to: centeredView, .bottom)
        _ = fillingView.constraint(.height, to: centeredView)
        
        _ = adaptativeLabel.center(.horizontaly, view.safeAreaLayoutGuide)
        _ = adaptativeLabel.center(.verticaly, view.safeAreaLayoutGuide, multiplier: 1.5)
    }
    
    private func setupRegex() {
        guard let originalText = labelView.text else { return }
        let match = "Doloremque dolore qui"
        let matches = originalText.matches(for: match)
        labelView.text = "\(originalText)\nSupposed to matches \"\(match)\"\nMatches: \(matches)"
    }
    
    @objc func handleNext() {
        navigationController?.pushViewController(collectionViewController, animated: true)
    }
}

