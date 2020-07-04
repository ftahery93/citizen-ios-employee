//
//  UITextView+Extension.swift
//  TG
//
//  Created by hardtask on 2/3/18.
//  Copyright © 2018 hardtask. All rights reserved.
//

import UIKit

extension UIButton {
    
    func adjustDefaultButton(fontColor: String?, fontSize: CGFloat?, fontType: String? , buttonText: String? = "", buttonImageName: String? = "") {
        
        if(fontSize != nil){
            var labelFontSize:CGFloat = fontSize!
            
            if (isEnglishApp() == false) {
//                labelFontSize = labelFontSize - 5
            }
            
            if (fontType=="1") {
                self.titleLabel?.font = UIFont(name: "myFontName".localized(), size: labelFontSize*iPhoneFactorX)!
            }
            if (fontType=="2") {
                self.titleLabel?.font = UIFont(name: "myFontNameBold".localized(), size: labelFontSize*iPhoneFactorX)!
            }
            if (fontType=="3") {
                self.titleLabel?.font = UIFont(name: "myFontNameRev".localized(), size: labelFontSize*iPhoneFactorX)!
            }
            
            if (fontType=="4") {
                self.titleLabel?.font = UIFont(name: "myFontNameBoldRev".localized(), size: labelFontSize*iPhoneFactorX)!
            }
            
            
        }
        
        
        if(fontColor != nil){
            self.setTitleColor(UIColor(hexString: fontColor!), for: .normal)
        }
    
    }
    
}

class RoundButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius: CGFloat = self.bounds.size.height / 2.0
        self.layer.cornerRadius = radius
    }
}
class CheckBox: UIButton {
    // Images
    let checkedImage = UIImage(named: "check_box_sel.png")! as UIImage
    let uncheckedImage = UIImage(named: "check_box_unsel.png")! as UIImage

    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }

     func setUpView() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }

    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
 
