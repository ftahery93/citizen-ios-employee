//
//  BottomBar.swift
//  NetLet
//
//  Created by Mohammed Yusuf Mitha on 02/03/20.
//  Copyright © 2020 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation

import UIKit
import Foundation

class BottomBar: UIView {
    var delegate : BottomBarDelegates?
    
    
    var homeButton = UIButton()
    var categoriesButton = UIButton()
    var cartButton = UIButton()
    var moreButton = UIButton()
    var cartCount = UILabel()
    
    
    @objc func homeButtonPressed() {
        if let selectedIndex = UserDefaults.standard.value(forKey: "selectedIndex") as? Int{
            if (selectedIndex == 0){//pop to root view controller, same tab selected again
                if let controller = UIApplication.getTopMostViewController() as? Base{
                    controller.navigationController?.popToRootViewController(animated: true)
                }
            }
            
        }
        UserDefaults.standard.set(0, forKey: "selectedIndex")
        UserDefaults.standard.synchronize()
        setButtonIndex()
        delegate?.homeButtonClicked()
    }
    @objc func categoriesButtonPressed() {
        if let selectedIndex = UserDefaults.standard.value(forKey: "selectedIndex") as? Int{
            if (selectedIndex == 1){//pop to root view controller, same tab selected again
                if let controller = UIApplication.getTopMostViewController() as? Base{
                    controller.navigationController?.popToRootViewController(animated: true)
                }
            }
        }
        UserDefaults.standard.set(1, forKey: "selectedIndex")
        UserDefaults.standard.synchronize()
        setButtonIndex()
        delegate?.categoriesButtonClicked()
    }
    @objc func cartButtonPressed() {
        if let selectedIndex = UserDefaults.standard.value(forKey: "selectedIndex") as? Int{
            if (selectedIndex == 2){//pop to root view controller, same tab selected again
                if let controller = UIApplication.getTopMostViewController() as? Base{
                    controller.navigationController?.popToRootViewController(animated: true)
                }
            }
            
        }
        UserDefaults.standard.set(2, forKey: "selectedIndex")
        UserDefaults.standard.synchronize()
        setButtonIndex()
        delegate?.cartButtonClicked()
    }
    @objc func moreButtonPressed() {
        if let selectedIndex = UserDefaults.standard.value(forKey: "selectedIndex") as? Int{
            if (selectedIndex == 3){//pop to root view controller, same tab selected again
                if let controller = UIApplication.getTopMostViewController() as? Base{
                    controller.navigationController?.popToRootViewController(animated: true)
                }
            }
            
        }
        UserDefaults.standard.set(3, forKey: "selectedIndex")
        UserDefaults.standard.synchronize()
        setButtonIndex()
        delegate?.moreButtonClicked()
    }
    
    
    func setUnselAll(){
        homeButton.setBackgroundImage( UIImage(named: "home_unsel.png") , for: .normal)
        categoriesButton.setBackgroundImage( UIImage(named: "cate_unsel.png") , for: .normal)
        cartButton.setBackgroundImage( UIImage(named: "cart_unsel.png") , for: .normal)
        moreButton.setBackgroundImage( UIImage(named: "more_unsel.png") , for: .normal)
        
        homeButton.setTitleColor(.lightGray, for: .normal)
        categoriesButton.setTitleColor(.lightGray, for: .normal)
        cartButton.setTitleColor(.lightGray, for: .normal)
        moreButton.setTitleColor(.lightGray, for: .normal)
    }
    func handleImageFor(index: Int){
        setUnselAll()
        
        switch index {
        case 0:
            homeButton.setBackgroundImage( UIImage(named: "home_sel.png") , for: .normal)
            homeButton.setTitleColor(myOrangeColor, for: .normal)
            break
        case 1:
            categoriesButton.setBackgroundImage( UIImage(named: "cate_sel.png") , for: .normal)
            categoriesButton.setTitleColor(myOrangeColor, for: .normal)
            
            break
        case 2:
            cartButton.setBackgroundImage( UIImage(named: "cart_sel.png") , for: .normal)
            cartButton.setTitleColor(myOrangeColor, for: .normal)
            
            break
        case 3:
            moreButton.setBackgroundImage( UIImage(named: "more_sel.png") , for: .normal)
            moreButton.setTitleColor(myOrangeColor, for: .normal)
            
            break
        default:
            print("should never come here")
            break
        }
        
    }
    func setButtonIndex(){
        let selectedIndex = UserDefaults.standard.value(forKey: "selectedIndex")
        handleImageFor(index: selectedIndex as! Int)
        
    }
    
    func layoutButtons(){
        self.addSubview(homeButton)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        homeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        homeButton.widthAnchor.constraint(equalToConstant: 90*iPhoneFactorX).isActive = true
        homeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        homeButton.addTarget(self, action: #selector(homeButtonPressed), for: .touchUpInside)
        
        self.addSubview(categoriesButton)
        categoriesButton.translatesAutoresizingMaskIntoConstraints = false
        categoriesButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        categoriesButton.leadingAnchor.constraint(equalTo: homeButton.trailingAnchor).isActive = true
        categoriesButton.widthAnchor.constraint(equalToConstant: 90*iPhoneFactorX).isActive = true
        categoriesButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        categoriesButton.addTarget(self, action: #selector(categoriesButtonPressed), for: .touchUpInside)
        
        self.addSubview(cartButton)
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        cartButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cartButton.leadingAnchor.constraint(equalTo: categoriesButton.trailingAnchor).isActive = true
        cartButton.widthAnchor.constraint(equalToConstant: 90*iPhoneFactorX).isActive = true
        cartButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        cartButton.addTarget(self, action: #selector(cartButtonPressed), for: .touchUpInside)
        
        
        self.addSubview(cartCount)
        cartCount.translatesAutoresizingMaskIntoConstraints = false
        cartCount.adjustDefaultLabel(fontColor: "#FFFFFF", fontSize: 10, fontType: "2")
        cartCount.topAnchor.constraint(equalTo: self.topAnchor, constant: 4*iPhoneFactorX).isActive = true
        cartCount.centerXAnchor.constraint(equalTo: cartButton.centerXAnchor, constant : 15.8*iPhoneFactorX/2).isActive = true
        cartCount.widthAnchor.constraint(equalToConstant: 15.8*iPhoneFactorX).isActive = true
        cartCount.heightAnchor.constraint(equalToConstant: 15.8*iPhoneFactorX).isActive = true
        cartCount.adjustsFontForContentSizeCategory = true
        cartCount.textAlignment = .center
        cartCount.backgroundColor = "#FF5722".toUIColor()
        cartCount.layer.borderColor = UIColor.white.cgColor
        cartCount.layer.borderWidth = 1*iPhoneFactorX
        cartCount.clipsToBounds = true
        cartCount.adjustsFontSizeToFitWidth = true
        cartCount.layer.cornerRadius = 15.8*iPhoneFactorX/2

        
        self.addSubview(moreButton)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        moreButton.leadingAnchor.constraint(equalTo: cartButton.trailingAnchor).isActive = true
        moreButton.widthAnchor.constraint(equalToConstant: 90*iPhoneFactorX).isActive = true
        moreButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        moreButton.addTarget(self, action: #selector(moreButtonPressed), for: .touchUpInside)
    }
    
    func setupView(){
        self.backgroundColor = .white
        setUnselAll()
        layoutButtons()
        let myButtonArray: [UIButton] = [homeButton, categoriesButton, cartButton, moreButton]
        homeButton.setTitle("home".localized(), for: .normal)
        categoriesButton.setTitle("categories".localized(), for: .normal)
        cartButton.setTitle("cartS".localized(), for: .normal)
        moreButton.setTitle("more".localized(), for: .normal)
        
        for each in myButtonArray{
          
            each.contentVerticalAlignment = .bottom
            each.setTitleColor(.lightGray, for: .normal)
            each.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
            each.adjustDefaultButton(fontColor: "#8D8D8D", fontSize: 12, fontType: "1", buttonText: nil, buttonImageName: nil)
        }
        
    }
    
    override func layoutSubviews() {

    }
}
protocol BottomBarDelegates {
    func homeButtonClicked()
    func categoriesButtonClicked()
    func cartButtonClicked()
    func moreButtonClicked()
}

extension UINavigationController {
    
    func backToViewController(vc: Any) {
        // iterate to find the type of vc
        for element in viewControllers as Array {
            if "\(type(of: element)).Type" == "\(type(of: vc))" {
                self.popToViewController(element, animated: true)
                break
            }
        }
    }
    
}
