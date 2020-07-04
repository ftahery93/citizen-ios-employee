//
//  UITextField+Extensions.swift
//  NetLet
//
//  Created by Mohammed Yusuf Mitha on 02/03/20.
//  Copyright © 2020 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation
extension UITextField {
    
    enum Direction {
        case Left
        case Right
    }
    
    // add image to textfield
    func withImage( image: UIImage){
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 114*iPhoneFactorX/3, height: 114*iPhoneFactorX/3))
        mainView.layer.cornerRadius = 5
        
        let view = UIView(frame: CGRect(x: 0, y: 0,width: 114*iPhoneFactorX/3, height: 114*iPhoneFactorX/3))
        view.backgroundColor = .clear
        view.clipsToBounds = true
        mainView.addSubview(view)
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 114*iPhoneFactorX/3, height: 114*iPhoneFactorX/3)
        view.addSubview(imageView)
        
        self.leftViewMode = .always
        self.leftView = mainView
        
        if(isEnglishApp() == true){
            self.semanticContentAttribute = .forceLeftToRight
        } else{
            self.semanticContentAttribute = .forceRightToLeft
        }
        
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
 
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        
        if(isEnglishApp() == true){
            self.semanticContentAttribute = .forceLeftToRight
        } else{
            self.semanticContentAttribute = .forceRightToLeft
        }
        
        
    }
    
}
extension UITextField {
    func placeholderColor(color: UIColor) {
        let attributeString = [
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.font: self.font!
            ] as [NSAttributedString.Key : Any]
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: attributeString)
    }
}
