//
//  UIView+Extension.swift
//  TG
//
//  Created by hardtask on 2/3/18.
//  Copyright © 2018 hardtask. All rights reserved.
//

import UIKit

extension UIView {
    
    func setupLayout(){
        if currentLanguage() == "en" {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        } else {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
    }
    
    func dropShadow(color: UIColor, opacity: Float, offSet: CGSize, radius: CGFloat, scale: Bool) {
        
        // self.center = self.center
        self.backgroundColor = UIColor.white
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = radius
        
//        layer.masksToBounds = false
//        layer.shadowColor = color.cgColor
//        layer.shadowOpacity = opacity
//        layer.shadowOffset = offSet
//        layer.shadowRadius = radius
//        
//        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
//        layer.shouldRasterize = true
//        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func addBottomLine(withColor color: UIColor = UIColor.lightGray.withAlphaComponent(0.5)){
        let line = UIView()
        self.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        
        line.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        line.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        line.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.backgroundColor = color
        self.layoutIfNeeded()
    }
    
    func addTopLine(withColor color: UIColor = UIColor.lightGray.withAlphaComponent(0.5), withHeight height : CGFloat = 1){
        let line = UIView()
        self.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        
        line.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        line.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        line.heightAnchor.constraint(equalToConstant: height).isActive = true
        line.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        line.backgroundColor = color
        
    }
    
    
    
    func addLeadingLine(withColor color: UIColor = UIColor.lightGray.withAlphaComponent(0.5)){
        let line = UIView()
        self.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        
        line.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        line.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        line.widthAnchor.constraint(equalToConstant: 1).isActive = true
        line.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        line.backgroundColor = color
        
    }
    
    func addTrailingLine(withColor color: UIColor = UIColor.lightGray.withAlphaComponent(0.5)){
        let line = UIView()
        self.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        
        line.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        line.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        line.widthAnchor.constraint(equalToConstant: 1).isActive = true
        line.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        line.backgroundColor = color
        
    }
    
    
 
    var globalPoint :CGPoint? {
        return self.superview?.convert(self.frame.origin, to: nil)
    }
    
    var globalFrame :CGRect? {
        return self.superview?.convert(self.frame, to: nil)
    }
 
    @objc func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}
