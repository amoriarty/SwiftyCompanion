//
//  SectionController.swift
//  SwiftyCompanion
//
//  Created by Alexandre LEGENT on 1/30/18.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import UIKit
import ToolboxLGNT

protocol SectionDelegate: class {
    func didSelectSection(at indexPath: IndexPath)
}

class SectionController: GenericCollectionViewController<SectionCell, String> {
    private var originConstraint: NSLayoutConstraint?
    private var sizeConstraint: NSLayoutConstraint?
    private var indexPath = IndexPath(item: 0, section: 0)
    private let gradientBar = GradientBar()
    weak var delegate: SectionDelegate?
    override var items: [[String]]? {
        return [["OVERVIEW", "PROJECTS", "ACHIEVMENTS", "PARTERNSHIP", "SKILLS"]]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView?.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
        gradientBar.resize()
    }
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .clear
        view.addSubview(gradientBar)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        let cellSize = sizeForItem(at: indexPath)
        _ = gradientBar.constraint(.bottom, to: view)
        _ = gradientBar.constraint(dimension: .height, constant: 2)
        originConstraint = gradientBar.constraint(.leading, to: view)
        sizeConstraint = gradientBar.constraint(dimension: .width, constant: cellSize.width)
    }
    
    override func setupCollectionView() {
        super.setupCollectionView()
        guard let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        layout.scrollDirection = .horizontal
        collectionView?.backgroundColor = .clear
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.isScrollEnabled = false
    }
    
    private func sizeForItem(at indexPath: IndexPath) -> CGSize {
        guard let frame = collectionView?.frame else { return .zero }
        guard let item = items?[indexPath.section][indexPath.item] else { return .zero }
        let size = CGSize(width: .infinity, height: frame.height)
        let attributes: [NSAttributedStringKey: Any] = [.font: UIFont.futuraBold(ofSize: 12)]
        let boundingRect = NSString(string: item).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return CGSize(width: boundingRect.width + 10, height: frame.height)
    }
    
    func scroll(at indexPath: IndexPath) {
        guard let collectionView = collectionView else { return }
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let previousCell = collectionView.cellForItem(at: self.indexPath) else { return }
        self.indexPath = indexPath
        previousCell.isSelected = false
        cell.isSelected = true
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
            self.originConstraint?.constant = cell.frame.origin.x - collectionView.contentOffset.x
            self.sizeConstraint?.constant = cell.frame.width
            self.view.layoutIfNeeded()
            self.gradientBar.resize()
        }, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sizeForItem(at: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectSection(at: indexPath)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let cell = collectionView?.cellForItem(at: indexPath) else { return }
        originConstraint?.constant = cell.frame.origin.x - scrollView.contentOffset.x
        view.layoutIfNeeded()
    }
}
