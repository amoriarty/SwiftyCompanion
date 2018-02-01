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
    private let items = ["OVERVIEW", "PROJECTS", "ACHIEVMENTS", "PARTERNSHIP", "PATRONAGE", "SKILLS"]
    private var originConstraint: NSLayoutConstraint?
    private var sizeConstraint: NSLayoutConstraint?
    private var indexPath = IndexPath(item: 0, section: 0)
    override var types: [DatasourceCell.Type] {
        return [SectionCell.self]
    }
    
    private let gradientBar: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.colors = [UIColor.swiftyLightBlue.cgColor, UIColor.swiftyGreen.cgColor]
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(gradientBar)
        gradientBar.layer.addSublayer(gradientLayer)
        setupLayouts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        gradientLayer.frame = gradientBar.bounds
        collectionView?.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
    }
    
    private func setupLayouts() {
        let indexPath = IndexPath(item: 0, section: 0)
        let cellSize = sizeForItem(at: indexPath)
        
        _ = gradientBar.constraint(.bottom, to: view)
        _ = gradientBar.constraint(dimension: .height, constant: 2)
        originConstraint = gradientBar.constraint(.leading, to: view)
        sizeConstraint = gradientBar.constraint(dimension: .width, constant: cellSize.width)
    }
    
    override func setup(collectionView: UICollectionView) {
        super.setup(collectionView: collectionView)
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        self.indexPath = indexPath
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
            self.originConstraint?.constant = cell.frame.origin.x - collectionView.contentOffset.x
            self.sizeConstraint?.constant = cell.frame.width
            self.view.layoutIfNeeded()
            self.gradientLayer.frame = self.gradientBar.bounds
        }, completion: nil)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let cell = collectionView?.cellForItem(at: indexPath) else { return }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.originConstraint?.constant = cell.frame.origin.x - scrollView.contentOffset.x
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
