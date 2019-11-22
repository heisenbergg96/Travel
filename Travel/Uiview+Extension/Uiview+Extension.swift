//
//  Uiview+Extension.swift
//  Travel
//
//  Created by Vikhyath on 21/11/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit

extension UIView {
    
    func dropShadow(color: UIColor = .lightGray, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 5, scale: Bool = true) {
        
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.borderWidth = 0
        layer.masksToBounds = false
        backgroundColor = .clear
    }
}

extension UICollectionView {
    
    func scrollToLast() {
        
        guard numberOfSections > 0 else {
            return
        }

        let lastSection = numberOfSections - 1

        guard numberOfItems(inSection: lastSection) > 0 else {
            return
        }

        let lastItemIndexPath = IndexPath(item: numberOfItems(inSection: lastSection) - 1,
                                          section: lastSection)
        scrollToItem(at: lastItemIndexPath, at: .bottom, animated: true)
    }
}
