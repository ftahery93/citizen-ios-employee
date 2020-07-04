//
//  MoreVC.swift
//  NetLet
//
//  Created by Mohammed Yusuf Mitha on 02/03/20.
//  Copyright © 2020 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation
import UIKit
import Localize_Swift

final class MoreVC: Base {
    
    var scroll = UIScrollView()
    
    var section1 = UIView()
    var section1Stack = UIStackView()
    var section1ButtonImages : [String] =  ["profile",
                                            "addresses",
                                            "myOrders",
                                            "myCash",
                                            "wishlist",
                                            "returnButt",
                                            "messages"]
    var section1ButtonTitles : [String] = ["profile_more".localized(),
                                           "addresses_more".localized(),
                                           "myOrders_more".localized(),
                                           "myCash_more".localized(),
                                           "wishlist_more".localized(),
                                           "returnButt_more".localized(),
                                           "messages_more".localized()]
    var profile = UIButton()
    var addresses = UIButton()
    var myOrders = UIButton()
    var myCash = UIButton()
    var wishlist = UIButton()
    var returnButt = UIButton()
    var messages = UIButton()
    
    
    var section2 = UIView()
    var section2Stack = UIStackView()
    var section2ButtonImages : [String] =  ["currency",
                                            "country",
                                            "language"]
    var section2ButtonTitles : [String] = ["currency_more".localized(),
                                           "country_more".localized(),
                                           "language_more".localized()]
    var currency = UIButton()
    var country = UIButton()
    var language = UIButton()
    
    var section2Stack2 = UIStackView()
    var section2ButtonImages2 : [String] =  ["",
                                             "",
                                             ""]
    var section2ButtonTitles2 : [String] = ["KWD".localized(),
                                            "KUWAIT".localized(),
                                            "chgLang2".localized()]
    var currency2 = UIButton()
    var country2 = UIButton()
    var language2 = UIButton()
    
    
    
    
    
    var section3 = UIView()
    var section3Stack = UIStackView()
    var section3ButtonImages : [String] =  ["faq",
                                            "legal",
                                            "contactUs"]
    
    var section3ButtonTitles : [String] = ["faq_more".localized(),
                                           "legal_more".localized(),
                                           "contactUs_more".localized()]
    var faq = UIButton()
    var legal = UIButton()
    var contactUs = UIButton()
    
    
    var logOutButt = UIButton()
    
    fileprivate func setUpViews() {
        self.view.addSubview(scroll)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.topAnchor.constraint(equalTo: topBar.bottomAnchor, constant: 0).isActive = true
        scroll.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        scroll.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        scroll.bottomAnchor.constraint(equalTo: bottomBar.topAnchor, constant: 0).isActive = true
        scroll.backgroundColor = .clear
        scroll.showsVerticalScrollIndicator = false
        scroll.contentInset = .init(top: 8*iPhoneFactorX, left: 0, bottom: 0, right: 0)
        
        scroll.addSubview(section1)
        section1.translatesAutoresizingMaskIntoConstraints = false
        section1.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 0*iPhoneFactorX).isActive = true
        section1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 12*iPhoneFactorX).isActive = true
        section1.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -12*iPhoneFactorX).isActive = true
        section1.layer.cornerRadius = 4
        section1.clipsToBounds = true
        section1.backgroundColor = .white
        section1.heightAnchor.constraint(equalToConstant: 245*iPhoneFactorX).isActive = true
        
        scroll.addSubview(section2)
        section2.translatesAutoresizingMaskIntoConstraints = false
        section2.topAnchor.constraint(equalTo: section1.bottomAnchor, constant: 8*iPhoneFactorX).isActive = true
        section2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 12*iPhoneFactorX).isActive = true
        section2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -12*iPhoneFactorX).isActive = true
        section2.layer.cornerRadius = 4
        section2.clipsToBounds = true
        section2.backgroundColor = .white
        section2.heightAnchor.constraint(equalToConstant: 100*iPhoneFactorX).isActive = true
        
        
        scroll.addSubview(section3)
        section3.translatesAutoresizingMaskIntoConstraints = false
        section3.topAnchor.constraint(equalTo: section2.bottomAnchor, constant: 8*iPhoneFactorX).isActive = true
        section3.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 12*iPhoneFactorX).isActive = true
        section3.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -12*iPhoneFactorX).isActive = true
        section3.layer.cornerRadius = 4
        section3.clipsToBounds = true
        section3.backgroundColor = .white
        section3.heightAnchor.constraint(equalToConstant: 100*iPhoneFactorX).isActive = true
        
        
        scroll.addSubview(logOutButt)
        logOutButt.translatesAutoresizingMaskIntoConstraints = false
        logOutButt.adjustDefaultButton(fontColor: "#FFFFFF", fontSize: 12, fontType: "2")
        logOutButt.topAnchor.constraint(equalTo: section3.bottomAnchor, constant: 20*iPhoneFactorX).isActive = true
        logOutButt.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        logOutButt.widthAnchor.constraint(equalToConstant: 110*iPhoneFactorX).isActive = true
        logOutButt.heightAnchor.constraint(equalToConstant: 30*iPhoneFactorX).isActive = true
        logOutButt.backgroundColor = "#FF5722".toUIColor()
        logOutButt.layer.cornerRadius = 4
        logOutButt.clipsToBounds = true
        logOutButt.setTitle(isloggedin ? "logout".localized().uppercased() : "login".localized().uppercased(), for: .normal)
        logOutButt.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        
        setUpSection1()
        setUpSection2()
        setUpSection3()
        
        if(isloggedin == true){
            
        } else{
            section1.removeFromSuperview()
        }
        
    }
    fileprivate func setUpSection1(){
        section1.addSubview(section1Stack)
        section1Stack.translatesAutoresizingMaskIntoConstraints = false
        section1Stack.topAnchor.constraint(equalTo: section1.topAnchor).isActive = true
        section1Stack.leadingAnchor.constraint(equalTo: section1.leadingAnchor).isActive = true
        section1Stack.trailingAnchor.constraint(equalTo: section1.trailingAnchor).isActive = true
        section1Stack.bottomAnchor.constraint(equalTo: section1.bottomAnchor).isActive = true
        
        section1Stack.axis = .vertical
        section1Stack.alignment = .center
        section1Stack.distribution = .equalSpacing
        section1Stack.spacing = 0
        
        var stackButtons = [profile,
                            addresses,
                            myOrders,
                            myCash,
                            wishlist,
                            returnButt,
                            messages]
        var i = 0
        
        for each in stackButtons{
            section1Stack.addArrangedSubview(each)
            each.translatesAutoresizingMaskIntoConstraints = false
            each.adjustDefaultButton(fontColor: "#535353", fontSize: 15, fontType: "1")
            each.setTitle(section1ButtonTitles[i], for: .normal)
            each.setImage(UIImage(named: section1ButtonImages[i]), for: .normal)
            i = i + 1
            each.heightAnchor.constraint(equalToConstant: 245/7 * iPhoneFactorX).isActive = true
            each.leadingAnchor.constraint(equalTo: section1.leadingAnchor).isActive = true
            each.trailingAnchor.constraint(equalTo: section1.trailingAnchor).isActive = true
            each.contentVerticalAlignment = .center
            each.contentHorizontalAlignment = .leading
            var inset = 4*iPhoneFactorX
            each.imageEdgeInsets = UIEdgeInsets(top: inset, left:  -4*inset, bottom: inset, right:  -4*inset)
            inset = inset*10
            each.titleEdgeInsets = UIEdgeInsets(top: 0, left: isEnglishApp() ? -inset : inset, bottom: 0, right: isEnglishApp() ? inset : -inset)
            each.imageView?.contentMode = .scaleAspectFit
            each.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        }
    }
    fileprivate func setUpSection3(){
        section3.addSubview(section3Stack)
        section3Stack.translatesAutoresizingMaskIntoConstraints = false
        section3Stack.topAnchor.constraint(equalTo: section3.topAnchor).isActive = true
        section3Stack.leadingAnchor.constraint(equalTo: section3.leadingAnchor).isActive = true
        section3Stack.trailingAnchor.constraint(equalTo: section3.trailingAnchor).isActive = true
        section3Stack.bottomAnchor.constraint(equalTo: section3.bottomAnchor).isActive = true
        
        section3Stack.axis = .vertical
        section3Stack.alignment = .center
        section3Stack.distribution = .equalSpacing
        section3Stack.spacing = 0
        
        var stackButtons = [faq,
                            legal,
                            contactUs]
        var i = 0
        
        for each in stackButtons{
            section3Stack.addArrangedSubview(each)
            each.translatesAutoresizingMaskIntoConstraints = false
            each.adjustDefaultButton(fontColor: "#535353", fontSize: 15, fontType: "1")
            each.setTitle(section3ButtonTitles[i], for: .normal)
            each.setImage(UIImage(named: section3ButtonImages[i]), for: .normal)
            i = i + 1
            each.heightAnchor.constraint(equalToConstant: 100/3 * iPhoneFactorX).isActive = true
            each.leadingAnchor.constraint(equalTo: section3.leadingAnchor).isActive = true
            each.trailingAnchor.constraint(equalTo: section3.trailingAnchor).isActive = true
            each.contentVerticalAlignment = .center
            each.contentHorizontalAlignment = .leading
            var inset = 4*iPhoneFactorX
            each.imageEdgeInsets = UIEdgeInsets(top: inset, left:  -4*inset, bottom: inset, right:  -4*inset)
            inset = inset*10
            each.titleEdgeInsets = UIEdgeInsets(top: 0, left: isEnglishApp() ? -inset : inset, bottom: 0, right: isEnglishApp() ? inset : -inset)
            each.imageView?.contentMode = .scaleAspectFit
            each.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            
        }
    }
    fileprivate func setUpSection2(){
        section2.addSubview(section2Stack)
        section2Stack.translatesAutoresizingMaskIntoConstraints = false
        section2Stack.topAnchor.constraint(equalTo: section2.topAnchor).isActive = true
        section2Stack.leadingAnchor.constraint(equalTo: section2.leadingAnchor).isActive = true
        section2Stack.trailingAnchor.constraint(equalTo: section2.trailingAnchor).isActive = true
        section2Stack.bottomAnchor.constraint(equalTo: section2.bottomAnchor).isActive = true
        
        section2Stack.axis = .vertical
        section2Stack.alignment = .center
        section2Stack.distribution = .equalSpacing
        section2Stack.spacing = 0
        
        
        
        var stackButtons = [currency,
                            country,
                            language]
        var i = 0
        
        for each in stackButtons{
            section2Stack.addArrangedSubview(each)
            each.translatesAutoresizingMaskIntoConstraints = false
            each.adjustDefaultButton(fontColor: "#535353", fontSize: 15, fontType: "1")
            each.setTitle(section2ButtonTitles[i], for: .normal)
            each.setImage(UIImage(named: section2ButtonImages[i]), for: .normal)
            i = i + 1
            each.heightAnchor.constraint(equalToConstant: 100/3 * iPhoneFactorX).isActive = true
            each.leadingAnchor.constraint(equalTo: section2.leadingAnchor).isActive = true
            each.trailingAnchor.constraint(equalTo: section2.trailingAnchor).isActive = true
            each.contentVerticalAlignment = .center
            each.contentHorizontalAlignment = .leading
            var inset = 4*iPhoneFactorX
            each.imageEdgeInsets = UIEdgeInsets(top: inset, left:  -4*inset, bottom: inset, right:  -4*inset)
            inset = inset*10
            each.titleEdgeInsets = UIEdgeInsets(top: 0, left: isEnglishApp() ? -inset : inset, bottom: 0, right: isEnglishApp() ? inset : -inset)
            each.imageView?.contentMode = .scaleAspectFit
            each.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            
        }
        
        
        section2.addSubview(section2Stack2)
        section2Stack2.translatesAutoresizingMaskIntoConstraints = false
        section2Stack2.topAnchor.constraint(equalTo: section2.topAnchor).isActive = true
        section2Stack2.trailingAnchor.constraint(equalTo: section2.trailingAnchor).isActive = true
        section2Stack2.bottomAnchor.constraint(equalTo: section2.bottomAnchor).isActive = true
        
        section2Stack2.axis = .vertical
        section2Stack2.alignment = .trailing
        section2Stack2.distribution = .equalSpacing
        section2Stack2.spacing = 0
        
        stackButtons = [currency2,
                        country2,
                        language2]
        i = 0
        
        for each in stackButtons{
            section2Stack2.addArrangedSubview(each)
            each.translatesAutoresizingMaskIntoConstraints = false
            each.adjustDefaultButton(fontColor: "#132F53", fontSize: 13, fontType: "1")
            each.setTitle(section2ButtonTitles2[i], for: .normal)
            // each.setImage(UIImage(named: section2ButtonImages2[i]), for: .normal)
            i = i + 1
            each.heightAnchor.constraint(equalToConstant: 100/3 * iPhoneFactorX).isActive = true
            each.trailingAnchor.constraint(equalTo: section2.trailingAnchor).isActive = true
            each.contentVerticalAlignment = .center
            var inset = 4*iPhoneFactorX
            //            each.imageEdgeInsets = UIEdgeInsets(top: inset, left:  -4*inset, bottom: inset, right:  -4*inset)
            inset = inset*5
            each.titleEdgeInsets = UIEdgeInsets(top: 0, left: isEnglishApp() ? -inset : inset, bottom: 0, right: isEnglishApp() ? inset : -inset)
            each.imageView?.contentMode = .scaleAspectFit
            each.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            
        }
        language2.adjustDefaultButton(fontColor: "#132F53", fontSize: 15, fontType: "1")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpViews()

    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scroll.contentSize.height = logOutButt.frame.origin.y + logOutButt.frame.height + 20*iPhoneFactorX
    }
    
    @objc func buttonAction(button : UIButton){
       /* switch button {
            case contactUs:
                let dest = ContactUsVC()
                self.navigationController?.pushViewController(dest, animated: true)
                break
            case language, language2:
                self.adjustLang(langugateToSet: "myLang3".localized())
                break
            case addresses:
                let dest = SavedAddressesVC()
                self.navigationController?.pushViewController(dest, animated: true)
                break
            case wishlist:
                let dest = WishListVC()
                self.navigationController?.pushViewController(dest, animated: true)
                break
            case returnButt:
                let dest = ReturnVC()
                self.navigationController?.pushViewController(dest, animated: true)
                break
            case myCash:
                let dest = MyCashListVC()
                self.navigationController?.pushViewController(dest, animated: true)
                break
            case myOrders:
                let dest = OrdersListVC()
                self.navigationController?.pushViewController(dest, animated: true)
                break
            case profile:
                let dest = RegisterVC()
                dest.comingForEditProfile = true
                self.navigationController?.pushViewController(dest, animated: true)
                break
            case messages:
                let dest = MessagesListVC()
                self.navigationController?.pushViewController(dest, animated: true)
                break
            case faq:
                let dest = FaqVC()
                self.navigationController?.pushViewController(dest, animated: true)
                break
            case logOutButt:
                if(isloggedin == true){
                    isloggedin = false
                    UserDefaults.standard.set("no", forKey: "isLoggedIn")
                    UserDefaults.standard.synchronize()
                }
                let dest = LoginVC()
                self.navigationController?.pushViewController(dest, animated: true)
                break
            default:
                break
        }*/
    }
    
    
    
    
    func adjustLang(langugateToSet:String) {
        UserDefaults.standard.set(langugateToSet, forKey: "appLang")
        if(langugateToSet == "en"){
            UserDefaults.standard.set("1", forKey: "language_id")
        }
        else{
            UserDefaults.standard.set("2", forKey: "language_id")
        }
        UserDefaults.standard.set(langugateToSet, forKey: "language_code")
        UserDefaults.standard.synchronize()
        Localize.setCurrentLanguage(langugateToSet)
        setAppleLanguage(langugateToSet)
        
        self.dismiss(animated: true) {
            UIApplication.getTopMostViewController()?.navigationController?.navigationController?.popToRootViewController(animated: true)
        }
        
    }
}
import SwiftUI
@available(iOS 13.0, *)
extension MoreVC: UIViewControllerRepresentable {
    func makeUIViewController(
        context:UIViewControllerRepresentableContext<MoreVC>
    ) -> MoreVC {
        let vc = MoreVC()
        // update the values of the vc, if needed
        return vc
    }
    func updateUIViewController(
        _ uiViewController: MoreVC,
        context: UIViewControllerRepresentableContext<MoreVC>) {}
}


@available(iOS 13.0, *)
struct MoreVCPreview: PreviewProvider {
    static var previews: some View {
        MoreVC()
            .edgesIgnoringSafeArea(.all)
            .statusBar(hidden: true)
    }
}

