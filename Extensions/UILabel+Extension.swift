//
//  UILabel+Extension.swift
//  TG
//
//  Created by hardtask on 2/3/18.
//  Copyright © 2018 hardtask. All rights reserved.
//

import UIKit

extension UILabel {
    
    func adjustDefaultLabel(fontColor: String?, fontSize: CGFloat?, fontType: String?) {
        
        self.numberOfLines = 0
        self.textAlignment = .natural
        self.lineBreakMode = .byWordWrapping
        
        if(fontSize != nil){
            var labelFontSize:CGFloat = fontSize!
            if (!isEnglishApp()) {
                labelFontSize = labelFontSize - 2
            }
            
            if (fontType=="1") {
                self.font = UIFont(name: "myFontName".localized(), size: labelFontSize*iPhoneFactorX)!
            }
            if (fontType=="2") {
                self.font = UIFont(name: "myFontNameBold".localized(), size: labelFontSize*iPhoneFactorX)!
            }
            if (fontType=="3" ) {
                self.font = UIFont(name: "myFontNameRev".localized(), size: labelFontSize*iPhoneFactorX)!
            }
            if (fontType=="4") {
                self.font = UIFont(name: "myFontNameBoldRev".localized(), size: labelFontSize*iPhoneFactorX)!
            }
        }
        self.backgroundColor = .clear
        if(fontColor != nil){
            self.textColor = UIColor(hexString: fontColor!)
        }
    }
    
}

