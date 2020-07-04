//
//  subtitleCV.swift
//  T3ALm
//
//  Created by Mohammed Yusuf Mitha on 26/11/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import UIKit

class subtitleCV: UITableViewCell {
    var title = UILabel()
    var subtitle = UILabel()
    let button = UIButton()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUpView(){
        var line = UIView()
        self.addSubview(line)
        self.addSubview(title)
        self.addSubview(subtitle)
        self.addSubview(button)
        title.adjustDefaultLabel(fontColor: blackColor, fontSize: 50, fontType: "1" )
        subtitle.adjustDefaultLabel(fontColor: UIColor.lightGray.toHexString(), fontSize: 35, fontType: "1")
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 130*widthFactor).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -130*widthFactor).isActive = true
        title.heightAnchor.constraint(equalToConstant: 70*widthFactor).isActive = true
        
        title.numberOfLines = 1
        subtitle.numberOfLines = 1
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 0).isActive = true
        subtitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 130*widthFactor).isActive = true
        subtitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -130*widthFactor).isActive = true
        subtitle.heightAnchor.constraint(equalToConstant: 50*widthFactor).isActive = true
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.topAnchor, constant: 0*widthFactor).isActive = true
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20*widthFactor).isActive = true
        button.isUserInteractionEnabled = false
        if (isEnglishApp()){
            button.setBackgroundImage(UIImage(named : "myAddress.png")?.withHorizontallyFlippedOrientation(), for: .normal)
        }else{
            button.setBackgroundImage(UIImage(named : "myAddress.png"), for: .normal)
        }
        
        title.textAlignment = isEnglishApp() ? .left : .right
        subtitle.textAlignment = isEnglishApp() ? .left : .right
        
        line.translatesAutoresizingMaskIntoConstraints = false
        line.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 10*widthFactor).isActive = true
        line.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        line.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        line.backgroundColor = UIColor(hexString: "ababab")
        line.alpha = line.alpha/2
        line.clipsToBounds = true
        subtitle.clipsToBounds = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
