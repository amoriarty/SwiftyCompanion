//
//  SectionController.swift
//  SwiftyCompanion
//
//  Created by Alexandre LEGENT on 1/30/18.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

class SectionController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    private let sections = ["OVERVIEW", "PROJECTS", "ACHIEVMENTS", "PARTERNSHIP", "PATRONAGE", "SKILLS"]
    private var originConstraint: NSLayoutConstraint?
    private var sizeConstraint: NSLayoutConstraint?
    private var indexPath = IndexPath(item: 0, section: 0)
    private let reuseId = "SectionCell"
    
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
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        gradientLayer.frame = gradientBar.bounds
        collectionView?.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
    }
    
    private func setupLayouts() {
        let cellSize = sizeForItem(at: indexPath)
        _ = gradientBar.constraint(.bottom, to: view)
        _ = gradientBar.constraint(dimension: .height, constant: 2)
        originConstraint = gradientBar.constraint(.leading, to: view)
        sizeConstraint = gradientBar.constraint(dimension: .width, constant: cellSize.width)
    }
    
    private func setupCollectionView() {
        guard let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        layout.scrollDirection = .horizontal
        collectionView?.backgroundColor = .clear
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.register(SectionCell.self, forCellWithReuseIdentifier: reuseId)
    }
    
    private func sizeForItem(at indexPath: IndexPath) -> CGSize {
        guard let frame = collectionView?.frame else { return .zero }
        let item = sections[indexPath.item]
        let size = CGSize(width: .infinity, height: frame.height)
        let attributes: [NSAttributedStringKey: Any] = [.font: UIFont.futuraBold(ofSize: 12)]
        let boundingRect = NSString(string: item).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return CGSize(width: boundingRect.width + 10, height: frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! SectionCell
        cell.section = sections[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sizeForItem(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
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
        originConstraint?.constant = cell.frame.origin.x - scrollView.contentOffset.x
        view.layoutIfNeeded()
    }
}
