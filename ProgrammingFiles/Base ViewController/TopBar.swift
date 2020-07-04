//
//  TopBar.swift
//  T3ALm
//
//  Created by Mohammed Yusuf Mitha on 28/10/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import UIKit

class TopBar: UIView {
    
    var backButton = UIButton()
    var topBarLogo = UIImageView()
    var searchButton = UIButton()
    var title = UILabel()
    var delegate : TopBarDelegate?
    
    @objc func backButtonClicked(_ sender: Any) {
        delegate?.backPressed()
    }
    
    @objc func searchButtonClicked(_ sender: Any) {
        delegate?.searchPressed()
    }
    
    
    func setupView() {
        
        self.backgroundColor = myBlueColor
        
        self.addSubview(backButton)
        self.addSubview(topBarLogo)
        self.addSubview(searchButton)
        self.addSubview(title)

        backButton.translatesAutoresizingMaskIntoConstraints = false
        topBarLogo.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false

        backButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 50*iPhoneFactorX).isActive = true
        backButton.setBackgroundImage( isEnglishApp() ? UIImage(named: "back_icon_white.png") : UIImage(named: "back_icon_white.png")?.withHorizontallyFlippedOrientation(), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        
        topBarLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        topBarLogo.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        topBarLogo.heightAnchor.constraint(equalToConstant: 50*iPhoneFactorX).isActive = true
        topBarLogo.image = UIImage(named: "top_bar_logo.png")
        topBarLogo.contentMode = .scaleAspectFit
        topBarLogo.isHidden = true
        
        title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        title.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        title.heightAnchor.constraint(equalToConstant: 50*iPhoneFactorX).isActive = true
        title.adjustDefaultLabel(fontColor: "#ffffff", fontSize: 15, fontType: "2")
        
        
        searchButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        searchButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 50*iPhoneFactorX).isActive = true
        searchButton.setBackgroundImage(UIImage(named: "search_icon.png"), for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        searchButton.isHidden = true
    }
    
    
}
protocol TopBarDelegate{
    func backPressed()
    func searchPressed()
    
}
