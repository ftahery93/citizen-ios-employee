//
//  LoginRegisterVC.swift
//  PlaygroundTest
//
//  Created by Mohammed Yusuf Mitha on 29/12/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import UIKit
import Localize_Swift

class LoginVC: Base {
    
    var logoIV = UIImageView()
    var mobileNumberTF = UITextField()
    var passwordTF = UITextField()
    var forgotPasswordButt = UIButton()
    var loginButt = UIButton()
    var registerButt = UIButton()
    var guestButt = UIButton()

        
    var changeLang = UIButton()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = myBackgroundColor
        topBar.isHidden = true
         for each in [logoIV, mobileNumberTF, passwordTF, forgotPasswordButt, loginButt, registerButt,guestButt]{
            each.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(each)
            
            if let butt = each as? UIButton{
                butt.adjustDefaultButton(fontColor: darkGray, fontSize: 12, fontType: "2", buttonText: nil, buttonImageName: nil)
            }
            if let tf = each as? UITextField{
                tf.adjustDefaultTextField(fontColor: blackColor, fontSize: 12, fontType: "1", placeholderText: "", actualTextToPrint: "", imageName: "")
                tf.textAlignment = .natural
            }
        }
        
        
        //MARK:- changeLang
        self.view.addSubview(changeLang)
        changeLang.translatesAutoresizingMaskIntoConstraints = false
        changeLang.adjustDefaultButton(fontColor: "#132f53", fontSize: 14, fontType: "3")
        changeLang.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15*iPhoneFactorX).isActive = true
        changeLang.heightAnchor.constraint(equalToConstant: 27*iPhoneFactorX).isActive = true
        changeLang.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -22*iPhoneFactorX).isActive = true
        changeLang.setTitle("chgLang2".localized(), for: .normal)
        changeLang.addTarget(self, action: #selector(changeLangAction), for: .touchUpInside)
        changeLang.isHidden = true
        //MARK:- Logo
        logoIV.centerXAnchor.constraint(equalTo: self.topBar.centerXAnchor, constant: 0).isActive = true
        logoIV.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 381*widthFactor).isActive = true
        logoIV.widthAnchor.constraint(equalToConstant: 235*widthFactor).isActive = true
        logoIV.heightAnchor.constraint(equalToConstant: 261*widthFactor).isActive = true
        logoIV.image = UIImage(named : "LoginLogo.png")
        logoIV.contentMode = .scaleAspectFit
        logoIV.isHidden = true
        //MARK:- mobileNumberTF
        mobileNumberTF.centerXAnchor.constraint(equalTo: self.topBar.centerXAnchor, constant: 0).isActive = true
        mobileNumberTF.topAnchor.constraint(equalTo: self.logoIV.bottomAnchor, constant: 120*widthFactor).isActive = true
        mobileNumberTF.leadingAnchor.constraint(equalTo: self.topBar.leadingAnchor, constant: 135*widthFactor).isActive = true
        mobileNumberTF.heightAnchor.constraint(equalToConstant: 150*widthFactor).isActive = true
        mobileNumberTF.placeholder = "Email"
        mobileNumberTF.backgroundColor = .white
        if let myImage = UIImage(named: "user_icon.png"){
            mobileNumberTF.withImage( image: myImage)
        }
        mobileNumberTF.textAlignment = isEnglishApp() ? .left : .right

        //MARK:- passwordTF
        passwordTF.centerXAnchor.constraint(equalTo: self.topBar.centerXAnchor, constant: 0).isActive = true
        passwordTF.topAnchor.constraint(equalTo: self.mobileNumberTF.bottomAnchor, constant: 48*widthFactor).isActive = true
        passwordTF.leadingAnchor.constraint(equalTo: self.topBar.leadingAnchor, constant: 135*widthFactor).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 150*widthFactor).isActive = true
        passwordTF.placeholder = "password".localized()
        passwordTF.isSecureTextEntry = true
        if let myImage = UIImage(named: "password_icon.png"){
            passwordTF.withImage( image: myImage)
        }
        passwordTF.backgroundColor = .white
        passwordTF.textAlignment = isEnglishApp() ? .left : .right

        //MARK:- forgotPasswordButt
        forgotPasswordButt.adjustDefaultButton(fontColor: darkGray, fontSize: 12, fontType: "1", buttonText: nil, buttonImageName: nil)
        forgotPasswordButt.centerXAnchor.constraint(equalTo: self.topBar.centerXAnchor, constant: 0).isActive = true
        forgotPasswordButt.topAnchor.constraint(equalTo: self.passwordTF.bottomAnchor, constant: 50*widthFactor).isActive = true
        forgotPasswordButt.leadingAnchor.constraint(equalTo: self.passwordTF.leadingAnchor).isActive = true
        forgotPasswordButt.heightAnchor.constraint(equalToConstant: 50*widthFactor).isActive = true
        forgotPasswordButt.setTitle("forgotPass".localized(), for: .normal)
        forgotPasswordButt.backgroundColor = UIColor.clear
        forgotPasswordButt.setTitleColor(UIColor.black.withAlphaComponent(0.5), for: .normal)
        forgotPasswordButt.addTarget(self, action: #selector(forgotPasswordAction), for: .touchUpInside)
        forgotPasswordButt.contentHorizontalAlignment = isEnglishApp() ? .left : .right
        forgotPasswordButt.isHidden = true
        //MARK:- loginButt
        loginButt.centerXAnchor.constraint(equalTo: self.topBar.centerXAnchor, constant: 0).isActive = true
        loginButt.topAnchor.constraint(equalTo: self.passwordTF.bottomAnchor, constant: 168*widthFactor).isActive = true
        loginButt.widthAnchor.constraint(equalToConstant: 330*widthFactor).isActive = true
        loginButt.heightAnchor.constraint(equalToConstant: 90*widthFactor).isActive = true
        loginButt.setTitle("login".localized(), for: .normal)
        loginButt.backgroundColor = myBlueColor
        loginButt.setTitleColor(UIColor.white, for: .normal)
        loginButt.addTarget(self, action: #selector(loginButtAction), for: .touchUpInside)
        loginButt.layer.cornerRadius = 4
        
        //MARK:- registerButt
        registerButt.adjustDefaultButton(fontColor: darkGray, fontSize: 12, fontType: "1", buttonText: nil, buttonImageName: nil)
        registerButt.centerXAnchor.constraint(equalTo: self.topBar.centerXAnchor, constant: 0).isActive = true
        registerButt.topAnchor.constraint(equalTo: self.loginButt.bottomAnchor, constant: 171*widthFactor).isActive = true
        registerButt.leadingAnchor.constraint(equalTo: self.topBar.leadingAnchor, constant: 140*widthFactor).isActive = true
        registerButt.heightAnchor.constraint(equalToConstant: 100*widthFactor).isActive = true
        registerButt.titleLabel?.numberOfLines = 2
        registerButt.contentHorizontalAlignment = .center
        registerButt.titleLabel?.textAlignment = .center
        
        let attriString1 = NSAttributedString(string:"You don't have account yet!\n".localized(), attributes:
            [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.5)])
        
        let attriString2 = NSAttributedString(string:"REGISTER NOW!".localized(), attributes:
            [NSAttributedString.Key.foregroundColor: myOrangeColor])
        
        registerButt.setAttributedTitle(attriString1+attriString2, for: .normal)
        registerButt.backgroundColor = UIColor.clear
     
        registerButt.addTarget(self, action: #selector(registerButtTapped), for: .touchUpInside)
        registerButt.isHidden = true
        
        //MARK:- guestButt
        guestButt.adjustDefaultButton(fontColor: darkGray, fontSize: 12, fontType: "1", buttonText: nil, buttonImageName: nil)
        guestButt.centerXAnchor.constraint(equalTo: self.topBar.centerXAnchor, constant: 0).isActive = true
        guestButt.topAnchor.constraint(equalTo: self.registerButt.bottomAnchor, constant: 50*widthFactor).isActive = true
        guestButt.heightAnchor.constraint(equalToConstant: 90*widthFactor).isActive = true
        guestButt.setTitle("continueAsGuest".localized(), for: .normal)
        guestButt.backgroundColor = .clear
        guestButt.setTitleColor(myBlueColor, for: .normal)
        guestButt.addTarget(self, action: #selector(guestButtAction), for: .touchUpInside)
        guestButt.layer.cornerRadius = 5
        guestButt.isHidden = true
    }
    
    @objc func changeLangAction(){
        self.adjustLang(langugateToSet: "myLang3".localized())

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
    @objc func guestButtAction(){
        isloggedin = false
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func forgotPasswordAction(){
        if( mobileNumberTF.text?.count == 0){
            self.view.makeToast("PleaseEnterMobileNumber".localized())
            return
        }
        sendPasswordNow()
    }
    
    func sendPasswordNow() {
        if (isConnectedToInternet()) {
            
            UserDefaults.standard.set(StringIdentifiers.send_password, forKey: "webserviceCalledFor")
            UserDefaults.standard.synchronize()
            
            // , "published_status" : "true"
            let params : [String: Any] = ["phones" : mobileNumberTF.text! ]
            showLoader()
            API.callDictionaryAPI(webserviceFor: StringIdentifiers.send_password, webMethod: .post, parameters: params, completion: { (error:Error?, task:Any?) in
                
                dismissLoader()
                
                if let tasks = task {
                    
                    // self.cartResponse = tasks as! CartResponse
                    
                    let alert = prepareAlertTopPart(titleForAlert: "done".localized(), textForAlert: "passDone2".localized())
                    
                    
                    let class001 = prepareAlertButtons(titleForButton: "dismiss".localized(), buttonStyle: .normal)
                    class001.addTarget(self, action: #selector(self.clickedDismiss), for: .touchUpInside)
                    alert.addAction( class001)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                    
                    
                }
                else {
                    if let error = error
                    {
                        print("mainErr-settings===\(error.localizedDescription)===\(UserDefaults.standard.string(forKey: "AppStatusCode")!)")
                        showToast(toastView: self.view, toastTitle: "myErr".localized(), toastText: "someErr".localized())
                    }
                }
            })
        }
    }

    
    @objc func registerButtTapped(){
        let destVC = RegisterVC()
        self.navigationController?.pushViewController(destVC, animated: true)
    }
    @objc func clickedDismiss() {
        
    }
    @objc func loginButtAction(){
        print("login pressed")
        if( mobileNumberTF.text?.count == 0){
            showToast(toastView: self.view, toastTitle: "Error", toastText: "Enter Email")
            mobileNumberTF.shake()
            return
        }
        if(passwordTF.text?.count == 0){
            showToast(toastView: self.view, toastTitle: "Error", toastText: "Enter password")
            passwordTF.shake()
            return
        }
        
        loginNow()
    }
    
    func loginNow() {
        
        if (isConnectedToInternet()) {
            
            
            UserDefaults.standard.set(StringIdentifiers.make_login, forKey: "webserviceCalledFor")
            UserDefaults.standard.synchronize()
            
            var params : [String: Any] = [
                "email": mobileNumberTF.text!,
                "password": passwordTF.text!,
            ]
            
            var obj001 = [String:Any]()
            obj001 = ["user" : params]
            params = ["obj001" : obj001]
            
            showLoader()
            
            API.callDictionaryAPI(webserviceFor: StringIdentifiers.guestUserLogin, webMethod: .post, parameters: params, completion: { (error:Error?, task:Any?) in
                
                dismissLoader()
                if let task = task as? LoginModel {
                    token = task.access_token ?? ""
                    UserDefaults.standard.set(token, forKey: "token")
                    UserDefaults.standard.synchronize()
                    
                    isloggedin = true
                    UserDefaults.standard.set(true, forKey: "isloggedin")
                    UserDefaults.standard.synchronize()
                    
                    self.navigationController?.popViewController(animated: true)

                } else {
                    if let error = error
                    {
                        showToast(toastView: self.view, toastTitle: "error", toastText: "Incorrect password")
                        print("mainErr-settings===\(error.localizedDescription)===\(UserDefaults.standard.string(forKey: "AppStatusCode")!)")
                        let appStatusCode: String = UserDefaults.standard.string(forKey: "AppStatusCode")!
                        print("appStatusCode===\(appStatusCode)")
                    }
                }
            })
        }
        
    }
    func fetchUserDetails() {
        
        if (isConnectedToInternet()) {
            
            UserDefaults.standard.set(StringIdentifiers.user_data, forKey: "webserviceCalledFor")
            UserDefaults.standard.synchronize()
            
            let param = [:] as [String:Any]
            
            showLoader()
            
            API.callDictionaryAPI(webserviceFor: StringIdentifiers.user_data, webMethod: .get, parameters: param, completion: { (error:Error?, task:Any?) in
                
                dismissLoader()
                
                if let tasks = task {
                    
                    let userData = tasks as! CustomersMainModel
                    
                    let userDetails = userData.customers ?? [Customers]()
                    
                    
                    if (userDetails.count>=1) {
                        globalUserObject = userDetails[0]
                        if(globalUserObject != nil){
                            let encoder = JSONEncoder()
                            if let encoded = try? encoder.encode(globalUserObject) {
                                let defaults = UserDefaults.standard
                                defaults.set(encoded, forKey: "globalUserObject")
                                defaults.synchronize()
                            }
                        }
                    } else {
                         
                    }
                }
                else {
                    if let error = error
                    {
                        print("mainErr-settings===\(error.localizedDescription)===\(UserDefaults.standard.string(forKey: "AppStatusCode")!)")
                        
                        let appStatusCode: String = UserDefaults.standard.string(forKey: "AppStatusCode")!
                        showToast(toastView: self.view, toastTitle: "myErr".localized(), toastText: "someErr".localized())
                    }
                }
            })
        }
    }

    
}
