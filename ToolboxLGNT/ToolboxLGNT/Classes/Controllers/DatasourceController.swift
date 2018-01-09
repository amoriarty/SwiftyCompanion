//
//  DatasourceController.swift
//  ToolboxLGNT
//
//  Created by Émilie Legent on 05/01/2018.
//

import UIKit

open class DatasourceController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    open var types: [DatasourceCell.Type] { return [] }
    open var headers: [DatasourceCell.Type] { return [] }
    open var footers: [DatasourceCell.Type] { return [] }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        guard let collectionView = collectionView else { return }
        setup(collectionView: collectionView)
    }
    
    open func setup(collectionView: UICollectionView) {
        var index = 0
        types.forEach { type in
            collectionView.register(type, forCellWithReuseIdentifier: "\(index)")
            index += 1
        }
        
        index = 0
        headers.forEach { type in
            collectionView.register(type, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header \(index)")
            index += 1
        }
        
        index = 0
        footers.forEach { type in
            collectionView.register(type, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footer \(index)")
            index += 1
        }
    }
    
    open override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems(in: section)
    }
    
    open override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section < types.count ? indexPath.section : types.count - 1
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(section)", for: indexPath) as! DatasourceCell
        cell.item = item(at: indexPath)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sizeForItem(at: indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing(in: section)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing(in: section)
    }
    
    open override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var cell: DatasourceCell?
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            cell = dequeuHeader(collectionView, at: indexPath)
            cell?.item = headerItem(at: indexPath)
        case UICollectionElementKindSectionFooter:
            cell = dequeuFooter(collectionView, at: indexPath)
            cell?.item = footerItem(at: indexPath)
        default: break
        }
        
        return cell ?? UICollectionReusableView()
    }
    
    private func dequeuHeader(_ collectionView: UICollectionView, at indexPath: IndexPath) -> DatasourceCell {
        let section = indexPath.section < headers.count ? indexPath.section : headers.count - 1
        return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header \(section)", for: indexPath) as! DatasourceCell
    }
    
    private func dequeuFooter(_ collectionView: UICollectionView, at indexPath: IndexPath) -> DatasourceCell {
        let section = indexPath.section < footers.count ? indexPath.section : footers.count - 1
        return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footer \(section)", for: indexPath) as! DatasourceCell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return sizeForHeader(in: section)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return sizeForFooter(in: section)
    }
    
    open func item(at indexPath: IndexPath) -> Any? { return nil }
    open func headerItem(at indexPath: IndexPath) -> Any? { return nil }
    open func footerItem(at indexPath: IndexPath) -> Any? { return nil }
    open func numberOfItems(in section: Int) -> Int { return 0 }
    open func sizeForItem(at indexPath: IndexPath) -> CGSize { return .zero }
    open func sizeForHeader(in section: Int) -> CGSize { return .zero }
    open func sizeForFooter(in section: Int) -> CGSize { return .zero }
    open func lineSpacing(in section: Int) -> CGFloat { return 10 }
    open func itemSpacing(in section: Int) -> CGFloat { return 10 }
    
    public init() { super.init(collectionViewLayout: UICollectionViewFlowLayout()) }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
