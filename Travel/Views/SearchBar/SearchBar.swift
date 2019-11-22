//
//  SearchBar.swift
//  Travel
//
//  Created by Vikhyath on 19/11/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit

protocol SearchBarDelegate: class {
    
    func searchBar(_ searchBar: SearchBar, startSearchWith searchString: String)
    func searchBarDidBeginSearching(_ searchBar: SearchBar)
}

class SearchBar: UIView {

    @IBOutlet weak var serachContainerView: UIView!
    @IBOutlet weak var serachTextField: UITextField!
    
    weak var delegate: SearchBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = frame.height/2
        clipsToBounds = true
        serachContainerView.layer.masksToBounds = true
        serachContainerView.layer.cornerRadius = frame.height/2
        serachTextField.delegate = self
    }

}

extension SearchBar: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Did begin called")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let searchString = textField.text else { return false }
        delegate?.searchBar(self, startSearchWith: searchString)
        
        return true
    }
}
