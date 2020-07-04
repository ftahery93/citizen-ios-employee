//
//  RegisterVC.swift
//  PlaygroundTest
//
//  Created by Mohammed Yusuf Mitha on 29/12/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import UIKit
import Alamofire
import Localize_Swift

class RegisterVC: Base {
    
    var logoIV = UIImageView()
    var firstName = UITextField()
    var lastName = UITextField()
    var mail = UITextField()
    var comingForEditProfile = false
    var mobileNumberTF = UITextField()
    var passwordTF = UITextField()
    var confirmPasswordTF = UITextField()
    var registerButt = UIButton()
    var checkButton = CheckBox()
    var tncButt = UIButton()
    var changeLang = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.backgroundColor = .clear
        topBar.searchButton.isHidden = true
        topBar.topBarLogo.isHidden = true
        topBar.backButton.setBackgroundImage( isEnglishApp() ? UIImage(named: "back.png") : UIImage(named: "back.png")?.withHorizontallyFlippedOrientation(), for: .normal)
        bottomBar.isHidden = true
        for each in [mail, firstName, lastName, logoIV, mobileNumberTF, passwordTF, tncButt, confirmPasswordTF, registerButt,checkButton]{
            each.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(each)
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
        
        //MARK:- logoIV
        logoIV.centerXAnchor.constraint(equalTo: self.topBar.centerXAnchor, constant: 0).isActive = true
        logoIV.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 231*widthFactor).isActive = true
        logoIV.widthAnchor.constraint(equalToConstant: 235*widthFactor).isActive = true
        logoIV.heightAnchor.constraint(equalToConstant: 261*widthFactor).isActive = true
        logoIV.image = UIImage(named : "LoginLogo.png")
        logoIV.contentMode = .scaleAspectFit
        
        //MARK:- firstName
        firstName.adjustDefaultTextField(fontColor: blackColor, fontSize: 12, fontType: "1", placeholderText: "fname".localized(), actualTextToPrint: "", imageName: "")
        firstName.leadingAnchor.constraint(equalTo: self.topBar.leadingAnchor, constant: 135*iPhoneFactorX/3).isActive = true
        firstName.topAnchor.constraint(equalTo: self.logoIV.bottomAnchor, constant: 105*iPhoneFactorX/3).isActive = true
        firstName.trailingAnchor.constraint(equalTo: self.topBar.centerXAnchor, constant: -24*iPhoneFactorX/3).isActive = true
        firstName.heightAnchor.constraint(equalToConstant: 114*iPhoneFactorX/3).isActive = true
        firstName.backgroundColor = .white
        firstName.setLeftPaddingPoints(10)
 
        //MARK:- lastName
        lastName.adjustDefaultTextField(fontColor: blackColor, fontSize: 12, fontType: "1", placeholderText: "lname".localized(), actualTextToPrint: "", imageName: "")
        lastName.trailingAnchor.constraint(equalTo: self.topBar.trailingAnchor, constant: -135*iPhoneFactorX/3).isActive = true
        lastName.topAnchor.constraint(equalTo: self.logoIV.bottomAnchor, constant: 105*iPhoneFactorX/3).isActive = true
        lastName.leadingAnchor.constraint(equalTo: self.topBar.centerXAnchor, constant: 24*iPhoneFactorX/3).isActive = true
        lastName.heightAnchor.constraint(equalToConstant: 114*iPhoneFactorX/3).isActive = true
        lastName.backgroundColor = .white
        lastName.setLeftPaddingPoints(10)
        
        
        //MARK:- mail
        mail.adjustDefaultTextField(fontColor: blackColor, fontSize: 12, fontType: "1", placeholderText: "email".localized(), actualTextToPrint: "", imageName: "")
        mail.trailingAnchor.constraint(equalTo: lastName.trailingAnchor).isActive = true
        mail.topAnchor.constraint(equalTo: self.lastName.bottomAnchor, constant: 48*iPhoneFactorX/3).isActive = true
        mail.leadingAnchor.constraint(equalTo: firstName.leadingAnchor).isActive = true
        mail.heightAnchor.constraint(equalToConstant: 114*iPhoneFactorX/3).isActive = true
        mail.backgroundColor = .white
        if let myImage = UIImage(named: "email_icon.png"){
            mail.withImage( image: myImage)
        }
        mail.backgroundColor = .white
        mail.textAlignment = isEnglishApp() ? .left : .right

        
        
        
        //MARK:- mobileNumberTF
        mobileNumberTF.adjustDefaultTextField(fontColor: blackColor, fontSize: 12, fontType: "1", placeholderText: "mobileNumber".localized(), actualTextToPrint: "", imageName: "")
        mobileNumberTF.trailingAnchor.constraint(equalTo: lastName.trailingAnchor).isActive = true
        mobileNumberTF.topAnchor.constraint(equalTo: self.mail.bottomAnchor, constant: 48*iPhoneFactorX/3).isActive = true
        mobileNumberTF.leadingAnchor.constraint(equalTo: firstName.leadingAnchor).isActive = true
        mobileNumberTF.heightAnchor.constraint(equalToConstant: 114*iPhoneFactorX/3).isActive = true
        mobileNumberTF.backgroundColor = .white
        if let myImage = UIImage(named: "phone_icon.png"){
            mobileNumberTF.withImage( image: myImage)
        }
        mobileNumberTF.backgroundColor = .white
        mobileNumberTF.textAlignment = isEnglishApp() ? .left : .right
        
         
        //MARK:- passwordTF
        passwordTF.adjustDefaultTextField(fontColor: blackColor, fontSize: 12, fontType: "1", placeholderText: "password".localized(), actualTextToPrint: "", imageName: "")
        passwordTF.trailingAnchor.constraint(equalTo: lastName.trailingAnchor).isActive = true
        passwordTF.topAnchor.constraint(equalTo: self.mobileNumberTF.bottomAnchor, constant: 48*iPhoneFactorX/3).isActive = true
        passwordTF.leadingAnchor.constraint(equalTo: firstName.leadingAnchor).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 114*iPhoneFactorX/3).isActive = true
        passwordTF.backgroundColor = .white
        if let myImage = UIImage(named: "password_icon.png"){
            passwordTF.withImage( image: myImage)
        }
        passwordTF.backgroundColor = .white
        passwordTF.textAlignment = isEnglishApp() ? .left : .right
        
        
        
        //MARK:- passwordTF
        confirmPasswordTF.adjustDefaultTextField(fontColor: blackColor, fontSize: 12, fontType: "1", placeholderText: "confPass".localized(), actualTextToPrint: "", imageName: "")
        confirmPasswordTF.trailingAnchor.constraint(equalTo: lastName.trailingAnchor).isActive = true
        confirmPasswordTF.topAnchor.constraint(equalTo: self.passwordTF.bottomAnchor, constant: 48*iPhoneFactorX/3).isActive = true
        confirmPasswordTF.leadingAnchor.constraint(equalTo: firstName.leadingAnchor).isActive = true
        confirmPasswordTF.heightAnchor.constraint(equalToConstant: 114*iPhoneFactorX/3).isActive = true
        confirmPasswordTF.backgroundColor = .white
        if let myImage = UIImage(named: "password_icon.png"){
            confirmPasswordTF.withImage( image: myImage)
        }
        confirmPasswordTF.backgroundColor = .white
        confirmPasswordTF.textAlignment = isEnglishApp() ? .left : .right
        
        
         
        checkButton.setUpView()
        checkButton.topAnchor.constraint(equalTo: self.confirmPasswordTF.bottomAnchor, constant: 48*widthFactor).isActive = true
        checkButton.leadingAnchor.constraint(equalTo: self.confirmPasswordTF.leadingAnchor).isActive = true
        checkButton.widthAnchor.constraint(equalToConstant: 48*widthFactor).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 48*widthFactor).isActive = true
        checkButton.backgroundColor = .clear
        
        tncButt.adjustDefaultButton(fontColor: darkGray, fontSize: 12, fontType: "1", buttonText: nil, buttonImageName: nil)
        tncButt.leadingAnchor.constraint(equalTo: self.checkButton.trailingAnchor, constant: 27*widthFactor).isActive = true
        tncButt.topAnchor.constraint(equalTo: self.confirmPasswordTF.bottomAnchor, constant: 48*widthFactor).isActive = true
        tncButt.heightAnchor.constraint(equalToConstant: 48*widthFactor).isActive = true
        tncButt.backgroundColor = .clear
        tncButt.setTitleColor(myOrangeColor, for: .normal)
        let attriString1 = NSAttributedString(string:"\("terms1".localized()) ", attributes:
            [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.5)])
        
        let attriString2 = NSAttributedString(string:"terms2".localized(), attributes:
            [NSAttributedString.Key.foregroundColor: myOrangeColor])
        
        tncButt.setAttributedTitle(attriString1+attriString2, for: .normal)
        tncButt.addTarget(self, action: #selector(tncButtAction), for: .touchUpInside)
        
        registerButt.adjustDefaultButton(fontColor: "#ffffff", fontSize: 12, fontType: "2")
        registerButt.topAnchor.constraint(equalTo: self.confirmPasswordTF.bottomAnchor, constant: 219*widthFactor).isActive = true
        registerButt.centerXAnchor.constraint(equalTo: self.topBar.centerXAnchor).isActive = true
        registerButt.heightAnchor.constraint(equalToConstant: 90*widthFactor).isActive = true
        registerButt.widthAnchor.constraint(equalToConstant: 330*widthFactor).isActive = true
        registerButt.layer.cornerRadius = 4
        registerButt.setTitle( comingForEditProfile ? "save".localized() : "register".localized(), for: .normal)
        registerButt.backgroundColor = myBlueColor
        registerButt.setTitleColor(UIColor.white, for: .normal)
        registerButt.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        
        if(comingForEditProfile == true){
            checkButton.isHidden = true
            tncButt.isHidden = true
            
            
            firstName.text = globalUserObject.first_name
            lastName.text = globalUserObject.last_name
            mail.text = globalUserObject.email
            mobileNumberTF.text = globalUserObject.username
            
        }
        
    }
    
    @objc func tncButtAction(){
        //show tnc webview here!
        
        
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
            UIApplication.getTopMostViewController()?.navigationController?.popToRootViewController(animated: true)
        }
        
    }
    @objc func registerAction(){
        
        
        
        if(firstName.text?.count == 0){
            self.view.makeToast("PleaseEnterfname".localized())
            return
        }
        if(lastName.text?.count == 0){
            self.view.makeToast("PleaseEnterlname".localized())
            return
        }
        if(mail.text?.count == 0){
            self.view.makeToast("PleaseEnterMail".localized())
            return
        }
        if(mobileNumberTF.text?.count == 0){
            self.view.makeToast("PleaseEnterMobileNumber".localized())
            return
        }
        if(passwordTF.text?.count == 0){
            self.view.makeToast("PleaseEnterPassword".localized())
            return
        }
        if(confirmPasswordTF.text?.count == 0){
            self.view.makeToast("conRecErr".localized())
            return
        }
        if(passwordTF.text! != confirmPasswordTF.text!){
            self.view.makeToast("conRecErr".localized())
            return
        }
        
        if( (checkButton.isChecked == false) && (comingForEditProfile == false) ){
            self.view.makeToast("checkBoxSelectionError".localized())
            return
        }
        
        registerUserNow()
    }
    
    
    func registerUserNow() {
        
        if (isConnectedToInternet()) {
 
            var myUser: RegisterUser = RegisterUser()
            myUser.first_name = firstName.text
            myUser.last_name = lastName.text
            myUser.email =  mail.text
            myUser.phone_number = mobileNumberTF.text
            myUser.username = mobileNumberTF.text
            myUser.password = passwordTF.text
            var params : [String: Any] = [
                "first_name": myUser.first_name!,
                "last_name": myUser.last_name!,
                "email" : myUser.email!,
                "phone": myUser.phone_number!,
                "username": myUser.username!,
                "role_ids" : [3]
            ]
            
            myUser.password = passwordTF.text
            let p1 : [String : Any] = [ "password" : myUser.password!]
            params.merge(p1, uniquingKeysWith: {(first, _) in first })
            
            
            var obj001 = [String:Any]()
            obj001 = ["customer" : params]
            params = ["obj001" : obj001]
            print("final params to be sent from vc is -->\(params)")
            var myMethod : HTTPMethod = .put
            showLoader()
            
            API.callDictionaryAPI(webserviceFor: StringIdentifiers.edit_user, webMethod: myMethod, parameters: params, completion: { (error:Error?, task:Any?) in
                
                dismissLoader()
                
                if let tasks = task {
                    let authorizationResponse : RegisterResponse = tasks as! RegisterResponse
                    print("AuthorizationRegister",authorizationResponse)
                    
                    print("incorrect status code callDictionaryAPI====\(UserDefaults.standard.string(forKey: "webserviceCalledFor")!)")
                    
                    print("userid====\(authorizationResponse.customers![0].id)")
                    globalUserObject = authorizationResponse.customers![0]
                    if(globalUserObject != nil){
                        let encoder = JSONEncoder()
                        if let encoded = try? encoder.encode(globalUserObject) {
                            let defaults = UserDefaults.standard
                            defaults.set(encoded, forKey: "globalUserObject")
                            defaults.synchronize()
                        }
                    }

                    
                    UserDefaults.standard.set("customer", forKey: "userType")
                    UserDefaults.standard.synchronize()
                    UserDefaults.standard.setValue( self.mobileNumberTF.text , forKey: "Login_Username")
                    UserDefaults.standard.setValue(self.passwordTF.text, forKey: "Login_Password")
                    UserDefaults.standard.setValue("yes", forKey: "isLoggedIn")
                    UserDefaults.standard.setValue("\(authorizationResponse.customers![0].id!)", forKey: "userId")
                    UserDefaults.standard.synchronize()
                    
                    myGlobalUserId = Int(authorizationResponse.customers![0].id ?? 0)
                    
                    
                    
                    let alert = prepareAlertTopPart(titleForAlert: "done".localized(), textForAlert: "thxReg".localized())
                    
                    let noButton = prepareAlertButtons(titleForButton: "dismiss".localized(), buttonStyle: .cancel)
                    noButton.addTarget(self, action: #selector(self.takeMeBAfReg), for: .touchUpInside)
                    alert.addAction(noButton)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                }
                else {
                    if let error = error
                    {
                        print("mainErr-settings===\(error.localizedDescription)===\(UserDefaults.standard.string(forKey: "AppStatusCode")!)")
                        
                        let appStatusCode: String = UserDefaults.standard.string(forKey: "AppStatusCode")!
                        
                        print("appStatusCode==\(appStatusCode)")
                        
                    }
                }
            })
        }
        
    }

    @objc func takeMeBAfReg(){
        isloggedin = true
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
}
