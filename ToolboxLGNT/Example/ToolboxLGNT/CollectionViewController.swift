//
//  CollectionViewController.swift
//  ToolboxLGNT_Example
//
//  Created by Émilie Legent on 05/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import ToolboxLGNT

class CollectionViewController: DatasourceController {
    private let items = ["hello", "world", "just adding few more cell", "just to be sure", "rudy", "can", "fail"]
    private let secondsSection = ["Seconds section of items", "blablabla"]
    private let horizontalController = HorizontalController()
    override var types: [DatasourceCell.Type] { return [ExampleCell.self/*, DifferentExample.self*/] }
    override var headers: [DatasourceCell.Type] { return [HeaderExample.self] }
    override var footers: [DatasourceCell.Type] { return [HeaderExample.self]}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nextButton = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(handleNext))
        navigationItem.rightBarButtonItem = nextButton
    }
    
    @objc func handleNext() {
        navigationController?.pushViewController(horizontalController, animated: true)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func numberOfItems(in section: Int) -> Int {
        return section == 0 ? items.count : secondsSection.count
    }
    
    override func item(at indexPath: IndexPath) -> Any? {
        return indexPath.section == 0 ? items[indexPath.item] : secondsSection[indexPath.item]
    }
    
    override func headerItem(at indexPath: IndexPath) -> Any? {
        return "Header !!!"
    }
    
    override func footerItem(at indexPath: IndexPath) -> Any? {
        return "Footer !!!"
    }
    
    override func sizeForItem(at indexPath: IndexPath) -> CGSize {
        guard let width = collectionView?.frame.width else { return .zero }
        return CGSize(width: width, height: 100)
    }
    
    override func sizeForHeader(in section: Int) -> CGSize {
        guard let width = collectionView?.frame.width else { return .zero }
        return CGSize(width: width, height: 150)
    }
    
    override func sizeForFooter(in section: Int) -> CGSize {
        guard let width = collectionView?.frame.width else { return .zero }
        return CGSize(width: width, height: 50)
    }
    
    override func lineSpacing(in section: Int) -> CGFloat {
        return 0
    }
}
