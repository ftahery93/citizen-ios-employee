//
//  mySearchBar.swift
//  NetLet
//
//  Created by Mohammed Yusuf Mitha on 15/04/20.
//  Copyright © 2020 Mohammed Yusuf Mitha. All rights reserved.
//

import UIKit
import Stevia

class mySearchBar: UIView {

    var parentView = UIView()
    var glassImageView = UIImageView()
    var searchTF = UITextField()
    var cancelButton = UIButton()
    var placeholderText : String? {
        didSet{
            searchTF.placeholder = placeholderText
        }
    }
    var delegate : mySearchBarDelegate?
    func setUpView(){
        self.addSubview(parentView)
        parentView.translatesAutoresizingMaskIntoConstraints = false
        parentView.fillContainer()
        parentView.backgroundColor = .white
        
        self.parentView.addSubview(glassImageView)
        glassImageView.translatesAutoresizingMaskIntoConstraints = false
        self.parentView.addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        self.parentView.addSubview(searchTF)
        searchTF.translatesAutoresizingMaskIntoConstraints = false
        
        glassImageView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        glassImageView.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
        glassImageView.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        glassImageView.heightEqualsWidth()
        glassImageView.image = UIImage(named: "search_icon_blue.png")
        glassImageView.contentMode = .scaleAspectFit
        
        cancelButton.adjustDefaultButton(fontColor: "#132F53", fontSize: 14, fontType: "1")
        cancelButton.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        cancelButton.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
        cancelButton.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: parentView.trailingAnchor, constant : 0).isActive = true
        cancelButton.setTitle("cancel".localized(), for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        searchTF.adjustDefaultTextField(fontColor: "#000000", fontSize: 14, fontType: "1", placeholderText: "nunu", actualTextToPrint: "", imageName: "")
        searchTF.leadingAnchor.constraint(equalTo: glassImageView.trailingAnchor).isActive = true
        searchTF.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
        searchTF.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        searchTF.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor).isActive = true
        searchTF.delegate = self
        searchTF.returnKeyType = .search
        searchTF.inputAccessoryView = UIView()
        
    }
     
}

extension mySearchBar: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
        
        cancelButton.leadingConstraint?.constant = -75*iPhoneFactorX
        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.searchBarSearchButtonClicked(searchString: searchTF.text)
        print("textFieldShouldReturn")
        searchPressed()
        return true
    }
    
    
    @objc func cancelButtonAction(){
        print("cancelButtonAction")
        
        cancelButton.leadingConstraint?.constant = 0
        searchTF.text = ""
        searchTF.resignFirstResponder()
        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
        delegate?.searchBarCancelButtonClicked()
    }
    
    @objc func searchPressed(){
        print("searchPressed")
        searchTF.resignFirstResponder()

//        cancelButton.leadingConstraint?.constant = 0
//        UIView.animate(withDuration: 0.25) {
//            self.layoutIfNeeded()
//        }
        delegate?.searchBarSearchButtonClicked(searchString: searchTF.text)
    }
}
 protocol mySearchBarDelegate{
    
    func searchBarSearchButtonClicked(searchString : String?) // called when keyboard search button pressed
    func searchBarCancelButtonClicked() // called when cancel button pressed
}
