//
//  Base.swift
//  T3ALm
//
//  Created by Mohammed Yusuf Mitha on 04/11/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import UIKit
//import SideMenu

class Base: UIViewController , UINavigationControllerDelegate,UIViewControllerTransitioningDelegate {
    
    var topBar = TopBar()
    var topBg = UIView()
    var bottomBar = BottomBar()
    var bottBg = UIView()

    var currentViewController : UIViewController?
    
    let simpleOver = customPopUp()

    func navigationController(
        _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationController.Operation,
        from fromVC: UIViewController,
        to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        simpleOver.popStyle = (operation == .pop)
        return simpleOver as UIViewControllerAnimatedTransitioning
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func updateCartCount(count : Int){
         bottomBar.cartCount.text = "\(count)"
        if(count == 0){
            bottomBar.cartCount.isHidden = true
        } else {
            bottomBar.cartCount.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.setupLayout()
        self.fetchCartCount()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if (UserDefaults.standard.value(forKey: "selectedIndex") == nil){
            UserDefaults.standard.set(0, forKey: "selectedIndex")
            UserDefaults.standard.synchronize()
        }
        bottomBar.setButtonIndex()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = myBackgroundColor
        self.view.setupLayout()
        self.hideKeyboardWhenTappedAround2()
        navigationController?.delegate = self
        self.navigationController?.isNavigationBarHidden = true
        
        self.view.addSubview(topBar)
        topBar.translatesAutoresizingMaskIntoConstraints = false
        topBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        topBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        topBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        topBar.heightAnchor.constraint(equalToConstant: 50*iPhoneFactorX).isActive = true
        topBar.delegate = self
        topBar.setupView()
        
        self.view.addSubview(bottomBar)
        bottomBar.translatesAutoresizingMaskIntoConstraints = false
        bottomBar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        bottomBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        bottomBar.heightAnchor.constraint(equalToConstant: 50*iPhoneFactorX).isActive = true
        bottomBar.delegate = self
        bottomBar.setupView()
        bottomBar.addTopLine(withColor: myBlueColor, withHeight: 3)
        if (self.navigationController?.viewControllers.count == 1){
            topBar.backButton.isHidden = true
        }else{
            topBar.backButton.isHidden = false
        }
        
        
        self.view.addSubview(topBg)
        topBg.translatesAutoresizingMaskIntoConstraints = false
        topBg.backgroundColor = myBlueColor
        topBg.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        topBg.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        topBg.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        topBg.bottomAnchor.constraint(equalTo: self.topBar.topAnchor, constant: 0).isActive = true
        
        self.view.addSubview(bottBg)
        bottBg.translatesAutoresizingMaskIntoConstraints = false
        bottBg.backgroundColor = .white
        bottBg.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        bottBg.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        bottBg.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        bottBg.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true

        
        bottomBar.isHidden = true
        
    }
}

extension Base : TopBarDelegate, BottomBarDelegates{
 
    
    func homeButtonClicked() {
        self.tabBarController?.selectedIndex = 0

    }
    
    
    func categoriesButtonClicked() {
        self.tabBarController?.selectedIndex = 1
        
    }
    
    func cartButtonClicked() {
        self.tabBarController?.selectedIndex = 2
        
    }
   
    
    func moreButtonClicked() {
        self.tabBarController?.selectedIndex = 3
    }
    
    

    func backPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func searchPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func fetchCartCount(){
    }
}


class myTotalLabel: UIView {
    
    
    var totalLabel = UILabel()
    var priceLabel = UILabel()
    var currencyLabel = UILabel()
    
    var price = 9999.999
    
    private func commonInit() {
        //custom initialization
        self.addSubview(totalLabel)
        self.addSubview(priceLabel)
        self.addSubview(currencyLabel)
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.numberOfLines = 1
        priceLabel.numberOfLines = 1
        currencyLabel.numberOfLines = 1
        
        totalLabel.adjustDefaultLabel(fontColor: "#FF5722", fontSize: 10, fontType: "2")
        totalLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        totalLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        totalLabel.text = "total".localized()
        
        priceLabel.adjustDefaultLabel(fontColor: "#FF5722", fontSize: 16, fontType: "2")
        priceLabel.topAnchor.constraint(equalTo: totalLabel.topAnchor).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: totalLabel.trailingAnchor, constant: 3*iPhoneFactorX).isActive = true
        priceLabel.text = "\(price)"
        
        currencyLabel.adjustDefaultLabel(fontColor: "#FF5722", fontSize: 10, fontType: "2")
        currencyLabel.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor).isActive = true
        currencyLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 3*iPhoneFactorX).isActive = true
        currencyLabel.text = "currency".localized()
        
        self.topAnchor.constraint(equalTo: totalLabel.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: totalLabel.leadingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: currencyLabel.trailingAnchor).isActive = true
        
        
    }
    
    func setPrice( _ price : Double){
        commonInit()
        priceLabel.text = String(format: "%.3f", price)
        totalLabel.sizeToFit()
        priceLabel.sizeToFit()
        currencyLabel.sizeToFit()
        self.layoutIfNeeded()
    }
    
    
}
class DynamicHeightCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}

class roundTextView: UITextView{
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.height/2
    }
}

 
