//
//  SectionController.swift
//  SwiftyCompanion
//
//  Created by Alexandre LEGENT on 1/30/18.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class SectionController: DatasourceController {
    private let items = ["OVERVIEW", "PROJECTS", "SKILLS"]
    override var types: [DatasourceCell.Type] {
        return [SectionCell.self]
    }
    
    private let gradientBar: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(gradientBar)
        setupLayouts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let indexPath = IndexPath(item: 0, section: 0)
        setupGradientLayer()
        collectionView?.selectItem(at: indexPath, animated: false, scrollPosition: .left)
    }
    
    private func setupLayouts() {
        let indexPath = IndexPath(item: 0, section: 0)
        let cellSize = sizeForItem(at: indexPath)
        _ = gradientBar.constraint(.leading, to: view)
        _ = gradientBar.constraint(.bottom, to: view)
        _ = gradientBar.constraint(dimension: .height, constant: 2)
        _ = gradientBar.constraint(dimension: .width, constant: cellSize.width)
    }
    
    private func setupGradientLayer() {
        let layer = CAGradientLayer()
        layer.frame = gradientBar.bounds
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.colors = [UIColor.swiftyLightBlue.cgColor, UIColor.swiftyGreen.cgColor]
        gradientBar.layer.addSublayer(layer)
    }
    
    override func setup(collectionView: UICollectionView) {
        super.setup(collectionView: collectionView)
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .clear
    }
    
    override func numberOfItems(in section: Int) -> Int {
        return items.count
    }
    
    override func item(at indexPath: IndexPath) -> Any? {
        return items[indexPath.item]
    }
    
    override func sizeForItem(at indexPath: IndexPath) -> CGSize {
        guard let frame = collectionView?.frame else { return .zero }
        let item = items[indexPath.item]
        let size = CGSize(width: .infinity, height: frame.height)
        let attributes: [NSAttributedStringKey: Any] = [.font: UIFont.futuraBold(ofSize: 12)]
        let boundingRect = NSString(string: item).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return CGSize(width: boundingRect.width + 10, height: frame.height)
    }
    
    override func itemSpacing(in section: Int) -> CGFloat {
        return 0
    }
}
