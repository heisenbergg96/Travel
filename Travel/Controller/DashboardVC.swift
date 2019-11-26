//
//  ViewController.swift
//  Travel
//
//  Created by Vikhyath on 19/11/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit

public let statusBarHeight = UIApplication.shared.statusBarFrame.size.height

class DashboardVC: BaseVC {

    @IBOutlet weak var serachViewCollectionView: UICollectionView!
    @IBOutlet weak var searchViewContainer: UIView!
    @IBOutlet weak var headerImageViewContainer: UIView!
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var suggestionTableView: UITableView!
    @IBOutlet weak var searchBarBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    let propertyAnimator = UIViewPropertyAnimator(duration: 0.6, curve: .linear, animations: nil)
    var imageViewheight: CGFloat = 0
    
    var heightConstant: CGFloat = 250 {
        
        didSet {
            headerHeightConstraint.constant = heightConstant
            visualEffectView.frame = headerImageViewContainer.bounds
            
            UIView.animate(withDuration: 1) {
                //self.view.layoutIfNeeded()
            }
        }
    }
    
    var searchView = SearchBar()
    
    fileprivate func registerCell() {
        
        serachViewCollectionView.register(UINib(nibName: "PopularCell", bundle: nil), forCellWithReuseIdentifier: "PopularCell")
        serachViewCollectionView.register(UINib(nibName: "HeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
    
    fileprivate func setupsearchView() {
        
        searchView = UINib(nibName: "SearchBar", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? SearchBar ?? SearchBar()
        searchViewContainer.addSubview(searchView)
        searchView.frame = searchViewContainer.bounds
        searchView.dropShadow(offSet: CGSize(width: 0, height: 5))
        searchView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        visualEffectView.effect = nil
        imageViewheight = headerHeightConstraint.constant
        serachViewCollectionView.contentInset = .init(top: 260, left: 0, bottom: 0, right: 0)
        registerCell()
        setupsearchView()
        
        propertyAnimator.addAnimations {
            self.visualEffectView.effect = UIBlurEffect(style: .dark)
        }
    }
}

extension DashboardVC: SearchBarDelegate {
    
    func searchBarDidBeginSearching(_ searchBar: SearchBar) {
        
        
    }
    
    func searchBar(_ searchBar: SearchBar, startSearchWith searchString: String) {
        
        print(searchString)
    }
}

extension DashboardVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath) as! PopularCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: collectionView.frame.width, height: 200)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
        headerView.delegate = self
        headerView.tag = indexPath.section
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        .init(width: collectionView.frame.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 20
    }
    
}


extension DashboardVC: HeaderViewDelegate {
    
    func headerView(_ headerView: HeaderView, didSelectItemAt section: Int) {
        
    }
}

extension DashboardVC {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print(scrollView.contentOffset.y)
        let offSet = scrollView.contentOffset.y + serachViewCollectionView.contentInset.top
        let fractionComplete = 1 - max(0, (imageViewheight - offSet)/imageViewheight)
        let maxHeight = statusBarHeight + 70
        
        propertyAnimator.fractionComplete = fractionComplete
        heightConstant = max(maxHeight, imageViewheight - offSet)
        searchBarBottomConstraint.constant = (fractionComplete * 35) - 25
    }
}


