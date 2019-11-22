//
//  HeaderView.swift
//  Travel
//
//  Created by Vikhyath on 19/11/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit


protocol HeaderViewDelegate: class {
    
    func headerView(_ headerView: HeaderView, didSelectItemAt section: Int)
}

class HeaderView: UICollectionViewCell {
    
    weak var delegate: HeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    @IBAction func seeAllButtonTapped(_ sender: UIButton) {
        
        print("See all tapped")
        delegate?.headerView(self, didSelectItemAt: tag)
    }
    
}
