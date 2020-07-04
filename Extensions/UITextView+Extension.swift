//
//  UITextView+Extension.swift
//  TG
//
//  Created by hardtask on 2/3/18.
//  Copyright © 2018 hardtask. All rights reserved.
//

import UIKit
import Localize_Swift

extension UITextView {
    
    func adjustDefaultTextView(fontColor: String, fontSize: CGFloat, fontType: String) {
        
        var labelFontSize:CGFloat = fontSize
        if (!isEnglishApp()) {
//            labelFontSize = labelFontSize - 5
        }
        
        self.backgroundColor = .clear
        
        self.textColor = UIColor(hexString: fontColor)

        self.textContainerInset = UIEdgeInsets(top: 10*iPhoneFactorX, left: -self.textContainer.lineFragmentPadding+(10*iPhoneFactorX), bottom: 10*iPhoneFactorX, right: -self.textContainer.lineFragmentPadding+(10*iPhoneFactorX))
        
        let myLang = "myLang".localized()
        switch myLang
        {
        case "en":
            self.textAlignment = .left
        case "ar":
            self.textAlignment = .right
        default:
            self.textAlignment = .left
        }
        
        // fontType
        // 1 - normal
        // 2 - normal bold
        // 3 - english font
        // 4 - arabic font
        // 5 - default reverse font (e.g. for english, it will be arabic
        self.font = UIFont(name: "myFontName".localized(), size: labelFontSize*iPhoneFactorX)!
        if (fontType=="2") {
            self.font = UIFont(name: "myFontNameBold".localized(), size: labelFontSize*iPhoneFactorX)!
        }
        if (fontType=="3") {
            self.font = UIFont(name: "defaultEn".localized(), size: labelFontSize*iPhoneFactorX)!
        }
        
        if (fontType=="4") {
            self.font = UIFont(name: "defaultAr".localized(), size: labelFontSize*iPhoneFactorX)!
        }
        
        if (fontType=="5") {
            self.font = UIFont(name: "defaultRev".localized(), size: labelFontSize*iPhoneFactorX)!
        }
        
 

        self.autocorrectionType = .no

    }
    
    func clearPadding(){
        self.textContainerInset = .zero
    }
}

