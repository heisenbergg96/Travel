//
//  HeaderLayout.swift
//  Travel
//
//  Created by Vikhyath Shetty on 25/11/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//


import UIKit

class HeaderLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let attributes = super.layoutAttributesForElements(in: rect)
        attributes?.forEach({ (attribute) in
            
            if attribute.representedElementKind == UICollectionView.elementKindSectionHeader {
                guard let cv = collectionView else { return }
            
                let contentOffSetY = cv.contentOffset.y
                let width = cv.frame.width
                print(contentOffSetY)
                let height = max(attribute.frame.height - contentOffSetY, 114)
                let yoffset = min(200, contentOffSetY)
                attribute.frame = CGRect(x: 0, y: yoffset, width: width, height: height)
        
                print(CGRect(x: 0, y: yoffset, width: width, height: height))
            }
        })
        return attributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        
        return true
    }
    
    override var minimumInteritemSpacing: CGFloat {
        
        set {
            super.minimumLineSpacing = newValue
        }
        get {
            return minimumLineSpacing
        }
    }
}
