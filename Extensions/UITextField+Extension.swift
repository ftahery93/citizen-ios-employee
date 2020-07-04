//
//  UITextField+Extension.swift
//  TG
//
//  Created by hardtask on 2/3/18.
//  Copyright © 2018 hardtask. All rights reserved.
//

import UIKit

extension UITextField {
    
    func adjustDefaultTextField(fontColor: String, fontSize: CGFloat, fontType: String, placeholderText: String?, actualTextToPrint: String, imageName: String) {
        
        var labelFontSize:CGFloat = fontSize
        if (!isEnglishApp()) {
//            labelFontSize = labelFontSize - 5
        }
        
        
        self.textColor = UIColor(hexString: fontColor)
         
        self.font = UIFont(name: "myFontName".localized(), size: labelFontSize*iPhoneFactorX)!
        if (fontType=="2") {
            self.font = UIFont(name: "myFontNameBold".localized(), size: labelFontSize*iPhoneFactorX)!
        }
        if (fontType=="3") {
            self.font = UIFont(name: "myFontNameRev".localized(), size: labelFontSize*iPhoneFactorX)!
        }
        
        if (fontType=="4") {
            self.font = UIFont(name: "myFontNameBoldRev".localized(), size: labelFontSize*iPhoneFactorX)!
        }
         
        
        self.borderStyle = .none
        if(placeholderText != nil){
            self.attributedPlaceholder = NSAttributedString(string: placeholderText!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#D5D5D5")])
            self.placeholder = placeholderText
        }
        if (!(actualTextToPrint.isEmpty)) {
            self.text = actualTextToPrint
        }
        
        if (imageName.count>=1) {
            self.background = adjustImageByLang(imageName: imageName)
        }
        
        self.autocorrectionType = .no
        
        self.textAlignment = isEnglishApp() ? .left : .right
        self.returnKeyType = .default
    }
    
    func clearTextFieldPadding() {
        
        let leftPaddingView = UIView(frame: CGRect(x: 0*iPhoneFactorX, y: 0, width: 0*iPhoneFactorX, height: self.frame.size.height))
        self.leftView = leftPaddingView
        self.leftView?.isHidden = true
        self.rightView?.isHidden = true
        
    }
    
    
}



extension UITextField  {
    func addLowerLine(withColor : UIColor){
        let line = UIView()
        line.backgroundColor = withColor
        line.frame = CGRect(x: 0,
                            y: self.frame.height - 1, width: self.frame.width, height: 1)
        self.addSubview(line)
    }
}

class linedTextField: UITextField {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addLowerLine(withColor: "#D8D8D8".toUIColor())
    }
}
