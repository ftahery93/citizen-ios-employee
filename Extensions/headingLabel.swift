//
//  headingLabel.swift
//  Marasna
//
//  Created by Mohammed Yusuf Mitha on 07/12/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation
//
//  UITextField+Extension.swift
//  TG
//
//  Created by hardtask on 2/3/18.
//  Copyright © 2018 hardtask. All rights reserved.
//

import UIKit
class headingLabel : UIButton{

 
  
    func setUp(){
        self.adjustDefaultButton(fontColor: fontColor003, fontSize: 45, fontType: "1", buttonText: nil, buttonImageName: nil)
        self.contentVerticalAlignment = .bottom
        self.titleLabel?.contentMode = .bottom
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0)
        self.backgroundColor = .clear
        self.contentHorizontalAlignment =  isEnglishApp() ? .left : .right
        self.isUserInteractionEnabled = false
     }
    
    required public init?(coder aDecoder:NSCoder) {
        super.init(coder:aDecoder)
        setUp()
     }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        setUp()
     }
   
    
    
}
