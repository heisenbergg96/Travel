//
//  PupularCell.swift
//  Travel
//
//  Created by Vikhyath on 19/11/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit

class PopularCell: UICollectionViewCell {
    
    @IBOutlet weak var popularcellCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        popularcellCollectionView.register(UINib(nibName: "PopularPlaceCell", bundle: nil), forCellWithReuseIdentifier: "PopularPlaceCell")
        popularcellCollectionView.contentInset = .init(top: 0, left: 10, bottom: 0, right: 10)
    }
}

extension PopularCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularPlaceCell", for: indexPath) as! PopularPlaceCell
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
         
        
        return CGSize(width: 300, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 20
    }
}
