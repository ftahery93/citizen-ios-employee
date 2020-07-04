//
//  globalFunctions.swift
//  T3ALm
//
//  Created by Mohammed Yusuf Mitha on 31/10/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift
import Toast_Swift
import EMAlertController
import SVProgressHUD
import Alamofire

var refreshAddress : Bool = false
var docController1: UIDocumentInteractionController?
let window = UIApplication.shared.keyWindow

func generateRandomString(maxLength : Int) -> String {
    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let len = UInt32(letters.length)
    
    var randomString = ""
    
    for _ in 0 ..< maxLength {
        let rand = arc4random_uniform(len)
        var nextChar = letters.character(at: Int(rand))
        randomString += NSString(characters: &nextChar, length: 1) as String
    }
    
    return randomString
}

func downloadPDFFile(pdfPath: String, passedView: UIView) {
    showLoader()
    let pdfUrl = NSURL(string: pdfPath)
    
    var request = URLRequest(url: pdfUrl! as URL)
    request.addValue(token, forHTTPHeaderField: "Authorization")
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let imageData = data {
            DispatchQueue.main.async {
                
                let httpResponse = response as? HTTPURLResponse
                print("test004==\(httpResponse)")
                dismissLoader()
                if(httpResponse?.statusCode == 200 && error == nil){
                    print("test005")
                    let documentsUrl =  FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first! as NSURL
                    print("test006")
                    let fileName = "\(generateRandomString(maxLength: 8)).pdf"
                    print("test007===\(fileName)")
                    let destinationUrl = documentsUrl.appendingPathComponent(fileName)
                    print("test008==\(destinationUrl)")
                    if let data = data {
                        print("test009")
                        do {
                            print("test010")
                            try data.write(to: destinationUrl!, options: .atomic)
                        } catch {
                            print("test011")
                            print(error)
                        }
                        print("test012")
                        
                        docController1 = UIDocumentInteractionController(url: destinationUrl!)
                        docController1?.presentOpenInMenu(from: CGRect.zero, in: passedView, animated: true)
                    }
                }
                
            }
        }
    }
    task.resume()
    
    
    //        print("pdfUrl===\(pdfUrl!)")
    //        if(pdfUrl != nil){
    //            print("test001")
    //            let pdfRequest: NSURLRequest = NSURLRequest(url: pdfUrl! as URL)
    //            print("test002")
    //            NSURLConnection.sendAsynchronousRequest(pdfRequest as URLRequest, queue: OperationQueue.main) {(response, data, error) in
    //                print("test003")
    //                let httpResponse = response as? HTTPURLResponse
    //                print("test004==\(httpResponse)")
    //                GlobalFunctions.dismissLoader()
    //                if(httpResponse?.statusCode == 200 && error == nil){
    //                    print("test005")
    //                    let documentsUrl =  FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first! as NSURL
    //                    print("test006")
    //                    let fileName = "\(GlobalFunctions.generateRandomString(maxLength: 8)).pdf"
    //                    print("test007===\(fileName)")
    //                    let destinationUrl = documentsUrl.appendingPathComponent(fileName)
    //                    print("test008==\(destinationUrl)")
    //                    if let data = data {
    //                        print("test009")
    //                        do {
    //                            print("test010")
    //                            try data.write(to: destinationUrl!, options: .atomic)
    //                        } catch {
    //                            print("test011")
    //                            print(error)
    //                        }
    //                        print("test012")
    //
    //                        docController1 = UIDocumentInteractionController(url: destinationUrl!)
    //                        docController1?.presentOpenInMenu(from: CGRect.zero, in: passedView, animated: true)
    //                    }
    //                }
    //
    //            }
    //
    //        }
}
func UTCToLocal(date:String, returnFormat : String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSS"
    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    dateFormatter.locale = NSLocale(localeIdentifier: "datePOS".localized()) as Locale?
    
    let dt = dateFormatter.date(from: date)
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.dateFormat = returnFormat
    dateFormatter.locale = NSLocale(localeIdentifier: "datePOS".localized()) as Locale?
    
    return dateFormatter.string(from: dt!)
}


func LikeProduct(productId : Int,completion:@escaping (_ done : Bool)->Void){
    
    if (isConnectedToInternet()) {
        var params : [String: Any] = [
            "shopping_cart_type" : 2,//1 is for add to cart, 2 is for add to wishlist
            "quantity": 1,
            "product_id": productId,
            "customer_id": myGlobalUserId
        ]
        
        var obj001 = [String:Any]()
        obj001 = ["shopping_cart_item" : params]
        params = ["obj001" : obj001]
        
        if(true){
            showLoader()
            API.callDictionaryAPI(webserviceFor: StringIdentifiers.product_add_cart, webMethod: .post, parameters: params,completion: { (error:Error?, task:Any?) in
                if let tasks = task {
                    dismissLoader()
                    print("Added to wishlist")
                    completion(true)
                }
                else {
                    if let error = error
                    {
                        print("error : ", error)
                        completion(false)
                    }
                }
            })
        }
    }
}

func DislikeProduct(productId : Int,completion:@escaping (_ done : Bool)->Void){
    
    if (isConnectedToInternet()) {
        
        
        let param = ["productId": productId] as [String:Any]
        
        API.callDictionaryAPI(webserviceFor: StringIdentifiers.disLike, webMethod: .delete, parameters: param, completion: { (error:Error?, task:Any?) in
            completion(true)
        })
    }
    
}



func fetchGuestUserNow() {
    if (isConnectedToInternet()) {
        
        UserDefaults.standard.set(StringIdentifiers.guestcustomers, forKey: "webserviceCalledFor")
        UserDefaults.standard.synchronize()
        
        let param = [:] as [String:Any]
        
        API.callDictionaryAPI(webserviceFor: StringIdentifiers.guestcustomers, webMethod: .post, parameters: param, completion: { (error:Error?, task:Any?) in
            
            
            if let tasks = task {
                
                let storeResponse : CustomersMainModel  = tasks as! CustomersMainModel
                
                var customersArray : [Customers] = storeResponse.customers ?? [Customers]()
                
                if (customersArray.count>=1) {
                    
                    UserDefaults.standard.set("\(customersArray[0].id!)", forKey: "userId")
                    
                    myGlobalUserId = customersArray[0].id!
                    print("My user id is : ", myGlobalUserId)
                    UserDefaults.standard.set("yes", forKey: "isGuestUser")
                    UserDefaults.standard.synchronize()
                    
                }
                
            }
            else {
                if let error = error
                {
                    print("mainErr-settings===\(error.localizedDescription)===\(UserDefaults.standard.string(forKey: "AppStatusCode")!)")
                    
                    let appStatusCode: String = UserDefaults.standard.string(forKey: "AppStatusCode")!
                    
                    
                    
                    
                    
                }
            }
            
        })
    }
}
func haveUserId() -> Bool {
    let isLoggedIn = UserDefaults.standard.string(forKey: "userId")!
    if (isLoggedIn=="0") {
        return false
    }
    
    return true
}
func isValidEmail(name: String, toastView: UIView, toastText: String, comingFor: String) -> Bool {
    // check the name length is greater then 1 or not
    if (comingFor != "email") {
        return true
    }
    
    var isValidString = name.replacingOccurrences(of: " ", with: "")
    if !(isValidString.count>=1) {
        showToast(toastView: toastView, toastTitle: "myErr".localized(), toastText: toastText)
        return false
    }
    
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    let checkForEmailValidation = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    if (!checkForEmailValidation.evaluate(with: isValidString)) {
        showToast(toastView: toastView, toastTitle: "myErr".localized(), toastText: toastText)
    }
    return checkForEmailValidation.evaluate(with: isValidString)
    
}
func mainQueue(_ closure: @escaping ()->()){
    DispatchQueue.main.async(execute: closure)
}

func resetAnimation(){
    globalImageurl = ""
    globalImageFrame = .zero
    globalDestImageFrame = .zero
}

func currentLanguage() -> String {
    let def = UserDefaults.standard
    let langs = def.object(forKey: "AppleLanguages") as! NSArray
    let firstLang = langs.firstObject as! String
    return firstLang
}
func setAppleLanguage(_ lang:String) {
    let def = UserDefaults.standard
    def.set([lang, currentLanguage()], forKey: "AppleLanguages")
    def.synchronize()
    UIView.appearance().semanticContentAttribute = isEnglishApp() ? .forceLeftToRight : .forceRightToLeft
}
func adjustImageByLang(imageName: String) -> UIImage {
    
    if (imageName.containsIgnoringCase(find: "XXX")) {
        if let myImg : UIImage = UIImage(named: imageName.replacingOccurrences(of: "XXX", with: "myLang".localized()))
        {
            return UIImage(named: imageName.replacingOccurrences(of: "XXX", with: "myLang".localized()))!
        }
    }
    
    if let _ : UIImage = UIImage(named: imageName) {
        return UIImage(named: imageName)!
    }
    
    return UIImage(named: "none.png")!
}
func adjustNormalFrame(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> CGRect {
    return CGRect(x: Int(x), y: Int(y), width: Int(width), height: Int(height))
}
func isEnglishApp() -> Bool {
    
    
    if ("myLang".localized() == "en") {
        return true
    }else{
        return false
    }
    
}
func localizedSitringFor(key:String)->String {
    return NSLocalizedString(key, comment: "")
}

func UpdateGlobalSelectAddress(forCityName city:String){
    
    
    var url = "http://monasba.hardtask.info/api/countries/StateCountry?CityName=\(city)"
    var headers : HTTPHeaders = [:]
    
    headers = [
        "Authorization": "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1ODczNjk1NDYsImV4cCI6MTkwMjcyOTU0NiwiaXNzIjoiaHR0cDovL25ldGxldC5oYXJkdGFzay5pbmZvIiwiYXVkIjpbImh0dHA6Ly9uZXRsZXQuaGFyZHRhc2suaW5mby9yZXNvdXJjZXMiLCJodF9hcGkiXSwiY2xpZW50X2lkIjoiODc1ZTFmMTQtMjgzNS00NzExLWJiY2EtYjFjODM0OTI1NjI3Iiwic3ViIjoiODc1ZTFmMTQtMjgzNS00NzExLWJiY2EtYjFjODM0OTI1NjI3IiwiYXV0aF90aW1lIjoxNTg3MzY5NTQ0LCJpZHAiOiJsb2NhbCIsInNjb3BlIjpbImh0X2FwaSIsIm9mZmxpbmVfYWNjZXNzIl0sImFtciI6WyJwd2QiXX0.g54KtdFKfL9QHq10gz4ixb0Elm224_oeqdeAkHuRcetDr5mUg9aAWUAudXmWUrxpDNhzjCakGt9Bm_jL0uRn1ijb4ov-H-4LksIrN7B4Re_tZ8F_S-o5gsPyfrjK-2qh4hQac_qX0eR8UfttNfCaThhLhGuMjoWUYJEdb3fr0x1IY51gV6puBIXjYhPX2i9xzfXPwzG2RKzlnci-VnuHOXiySRLzuiQWtRhLeI8wiehgITQq-uqmHEy4QuRE96zo5qYp5cefunGMcSqIunYbEBIQMYAsDQmINdiivx_H3_A3XfdXqgqF5c5FCDKqZtWRk2lRhE5t9nexWzRPj-VyyQ",
        "Accept-Language": "\(UserDefaults.standard.string(forKey: "language_code")!)"
    ]
    
    url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    print("url for city is : ", url)
    
    showLoader()
    AF.request(url, method: .get, parameters:nil, encoding: CustomGetEncoding(), headers: headers )
        .responseJSON { (response) in
            
            dismissLoader()
            
            switch response.result{
                case .success(let value):
                    do{
                        print(value)
                        let data = response.data
                        let addressData = try JSONDecoder().decode(stateCountryDto.self, from: data!)
                        print("succesfully decoded : ", addressData.stateCountryDto)
                        
                        let countryIdFromLocation = addressData.stateCountryDto.country_id
                        let areaIdFromLocation = addressData.stateCountryDto.city_id
                        let cityIdFromLocation = addressData.stateCountryDto.stateProvince_id
                        
                        let country = addressData.stateCountryDto.countryt_name
                        let city = addressData.stateCountryDto.state_name
                        let area = addressData.stateCountryDto.city_name
                        
                        globalSelectedAddress = Addresses(first_name: nil,
                                                          last_name: nil,
                                                          email: nil,
                                                          company: nil,
                                                          country_id: countryIdFromLocation,
                                                          country: country,
                                                          parent_state_province_id: cityIdFromLocation,
                                                          state_province_id: nil,
                                                          city: nil,
                                                          block: nil,
                                                          building: nil,
                                                          paci: nil,
                                                          avenue: nil,
                                                          floor: nil,
                                                          flat: nil,
                                                          address1: nil,
                                                          address2: nil,
                                                          zip_postal_code: nil,
                                                          phone_number: nil,
                                                          fax_number: nil,
                                                          created_on_utc: nil,
                                                          parent_province: city,
                                                          province: area,
                                                          is_default: nil,
                                                          id: 0)
                        
                         
                        
                        /*Addresses(title: nil,
                         first_name: nil,
                         last_name: nil,
                         email: nil,
                         company: nil,
                         country: country, country_id: countryIdFromLocation,
                         province: city, state_province_id: cityIdFromLocation,
                         city: area, city_id: areaIdFromLocation,
                         block: nil,
                         zip_postal_code: nil,
                         address1: nil,
                         address2: nil,
                         phone_number: nil,
                         fax_number: nil,
                         customer_attributes: nil,
                         created_on_utc: nil,
                         id: 0)*/
                        
                        let encoder = JSONEncoder()
                        if let encoded = try? encoder.encode(globalSelectedAddress) {
                            let defaults = UserDefaults.standard
                            defaults.set(encoded, forKey: "globalSelectedAddress")
                            defaults.synchronize()
                        }
                        
                        break
                        
                    }
                    catch{
                        print("error occured while decoding : ", error )
                }
                case .failure(let myerror):
                    print("Failed for url : ", url, " with error : ", myerror)
                    break
            }
            
            
    }
    
}

func checkItemForQuantityForCart(productOject : Product, quantity : Int) -> Bool {
    
    print("productOject==\(productOject.order_maximum_quantity ?? -99)")
    
    var isAllowed : Bool = true
    
    
    if (productOject.order_maximum_quantity != nil) {
        if (quantity > (productOject.order_maximum_quantity ?? 0)) {
            isAllowed = false
        } else {
            
        }
    }
    
    if (!isAllowed) {
        
        let alert = prepareAlertTopPart(titleForAlert: "note".localized(), textForAlert: "MaximumQuantityAllowedLabel".localized().replacingOccurrences(of: "XXX", with: "\((productOject.order_maximum_quantity ?? 0))"))
        
        let class001 = prepareAlertButtons(titleForButton: "dismiss".localized(), buttonStyle: .normal)
        alert.addAction(class001)
        
        UIApplication.getTopMostViewController()?.present(alert, animated: true, completion: nil)
        
    }
    
    
    return isAllowed
}


func checkAttributesForTextBox(myattributeId: Int, productObject : Product) -> String? {
    
    
    for eachAttribute in productObject.attributes!{
        if(myattributeId == eachAttribute.id){
            if (eachAttribute.attribute_values == nil){
                return eachAttribute.name_localized
            }
        }
    }
    return nil
}

@available(iOS 13.0, *)
let loader = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)

func showLoader() {
    DispatchQueue.global(qos: .default).async(execute: {() -> Void in
        DispatchQueue.main.async(execute: {() -> Void in
            if #available(iOS 13.0, *) {
                loader.frame = CGRect(x: (screenWidth/2) - 50,
                                      y: (screenHeight/2) - 50,
                                      width: 100,
                                      height: 100)
                loader.color = .black
                loader.hidesWhenStopped = true
                UIApplication.getTopMostViewController()?.view.addSubview(loader)
                loader.startAnimating()
            } else {
                SVProgressHUD.show()
            }
            
            UIApplication.shared.beginIgnoringInteractionEvents()
        })
    })
    
}
func dismissLoader() {
    DispatchQueue.global(qos: .default).async(execute: {() -> Void in
        DispatchQueue.main.async(execute: {() -> Void in
            if #available(iOS 13.0, *) {
                loader.stopAnimating()
            } else {
                SVProgressHUD.dismiss()
            }
            UIApplication.shared.endIgnoringInteractionEvents()
        })
    })
    
}
func adjustLanguageFrame(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> CGRect {
    
    if (isEnglishApp()) {
        // return CGRect(x: x, y: y, width: width, height: height)
        return CGRect(x: Int(x), y: Int(y), width: Int(width), height: Int(height))
    } else {
        var myStartPosition = (1080*widthFactor)-x-width
        if (myStartPosition<=0) {
            myStartPosition = 0
        }
        // return CGRect(x: myStartPosition, y: y, width: width, height: height)
        return CGRect(x: Int(myStartPosition), y: Int(y), width: Int(width), height: Int(height))
    }
    
    // return CGRect(x: x, y: y, width: width, height: height)
}
func showToast(toastView: UIView, toastTitle: String, toastText: String) {
    var toastStyle = ToastStyle()
    
    // this is just one of many style options
    toastStyle.backgroundColor = UIColor(hexString: fontColor003)
    toastStyle.titleAlignment = .center
    toastStyle.titleFont = UIFont(name: "myFontName".localized(), size: 45*widthFactor)!
    toastStyle.titleColor = UIColor(hexString: "#FFFFFF")
    toastStyle.messageColor = UIColor(hexString: "#FFFFFF")
    toastStyle.messageFont = UIFont(name: "myFontName".localized(), size: 40*widthFactor)!
    toastStyle.messageAlignment = .center
    
    toastView.hideAllToasts()
    
    toastView.makeToast(toastText, duration: 3.0, position: .bottom, title: toastTitle, image: nil, style: toastStyle, completion: nil)
}
func showNoInternetToast() {
    if let cvc = UIApplication.shared.keyWindow?.currentViewController(){
        showToast(toastView: cvc.view, toastTitle: "noInternet".localized(), toastText: "wifiError".localized())
    }
}
func isConnectedToInternet() ->Bool {
    if (!(NetworkReachabilityManager()!.isReachable)) {
        showNoInternetToast()
    }
    return NetworkReachabilityManager()!.isReachable
}
func returnDirectionBasedOnLang() -> NSTextAlignment {
    
    if ("myLang".localized() == "en") {
        return NSTextAlignment.left
    }
    
    return NSTextAlignment.right
    
}
func addTopBarTo(view: UIView)->TopBar{
    
    let topbar = TopBar()
    topbar.setupView()
    view.addSubview(topbar)
    return topbar
}
func setUpTopBar(topBar: TopBar, view: UIView)->TopBar{
    
    topBar.setupView()
    view.addSubview(topBar)
    return topBar
}


//let iphoneBottomArea = window?.safeAreaInsets.bottom

func printAllFonts() {
    
    let fontFamilyNames = UIFont.familyNames
    for familyName in fontFamilyNames {
        print("------------------------------")
        print("Font Family Name = [\(familyName)]")
        let names = UIFont.fontNames(forFamilyName: familyName)
        print("Font Names = [\(names)]")
    }
}


var token = ""

func prepareAlertTopPart(titleForAlert: String, textForAlert: String) -> EMAlertController {
    
    let alert = EMAlertController(title: titleForAlert, message: "\n\(textForAlert)")
    
    alert.buttonSpacing = 0
    
    // alert.titleLabel.font = UIFont(name: "myFontNameBold".localized(), size: GlobalFunctions.isEnglishApp() ? 50*iPhoneFactorX : 45*iPhoneFactorX)!
    alert.titleColor = UIColor(hexString: fontColor001)
    
    //  alert.messageTextView.font = UIFont(name: "myFontName".localized(), size: GlobalFunctions.isEnglishApp() ? 45*iPhoneFactorX : 40*iPhoneFactorX)!
    alert.messageColor = UIColor(hexString: fontColor001)
    
    return alert
    
    // UIApplication.shared.keyWindow?.currentViewController()?.present(alert, animated: true, completion: nil)
    
}
func prepareAlertButtons(titleForButton: String, buttonStyle: EMAlertActionStyle) -> EMAlertAction {
    let alertButton = EMAlertAction(title: "\(titleForButton)", style: buttonStyle)
    //  alertButton.titleFont = UIFont(name: "myFontName".localized(), size: GlobalFunctions.isEnglishApp() ? 45*iPhoneFactorX : 40*iPhoneFactorX)!
    
    alertButton.titleColor = UIColor(hexString: fontColor003)
    
    if (buttonStyle == .cancel) {
        alertButton.titleColor = UIColor(hexString: "#FF0000")
    }
    
    return alertButton
}
func fetchDateInSpecificFormat(actualDate: Date, outputFormat:String) -> String {
    
    let dateFormatter = DateFormatter()
    // //// dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    dateFormatter.dateFormat = outputFormat
    dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
    
    let finalString: String = dateFormatter.string(from: actualDate)
    
    print("fetchDateInSpecificFormat==finalString===\(finalString)==\(actualDate)")
    
    return finalString
}
func fetchDateFromString(actualStringAsDate: String, withDateFormatter: String) -> Date {
    let dateFormatter = DateFormatter()
    //// dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    dateFormatter.dateFormat = withDateFormatter
    dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as! Locale
    
    return dateFormatter.date(from: actualStringAsDate)!
}
func fetchDateFromStringUTC(actualStringAsDate: String, withDateFormatter: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    dateFormatter.dateFormat = withDateFormatter
    dateFormatter.locale = NSLocale(localeIdentifier: "datePOS".localized()) as Locale?
    
    return dateFormatter.date(from: actualStringAsDate)!
}
func fetchTextOfAttributeBasedOnId(attributeId: Int, productObject : Product) -> String {
    
    var mString : String = ""
    
    if (productObject.id! >= 1) {
        
        var vAtt001 : [Attributes] = productObject.attributes ?? [Attributes]()
        var vAtt002 : [Attribute_values] = [Attribute_values]()
        
        for i in 0..<vAtt001.count {
            
            vAtt002 = vAtt001[i].attribute_values ?? [Attribute_values]()
            
            for j in 0..<vAtt002.count {
                if (attributeId == vAtt002[j].id!) {
                    mString = "\(vAtt001[i].name_localized) : \(vAtt002[j].name_localized)"
                    
                    if (!((vAtt002[j].price_adjustment ?? 0.0) == 0.00)) {
                        mString = "\(mString) [\(vAtt002[j].price_after_adjustment ?? "")]"
                    }
                    
                    break
                }
            }
        }
        
    }
    
    
    return mString
}



var storesArray : [Stores] = [Stores]()
var langArray : [Store_languages] = [Store_languages]()




func fetchCartType() {
    if (isConnectedToInternet()) {
        
        UserDefaults.standard.set(StringIdentifiers.shopping_cart, forKey: "webserviceCalledFor2")
        UserDefaults.standard.synchronize()
        
        var cartResponse : CartResponse = CartResponse()
        
        // , "published_status" : "true"
        var params : [String: Any] = ["shopping_cart_type_id": 1,
                                      "fields" : "product",
                                      "page": 1,
                                      "limit": 1]
        
        API.callDictionaryAPI(webserviceFor: StringIdentifiers.shopping_cart, webMethod: .get, parameters: params, completion: { (error:Error?, task:Any?) in
            
            
            if let tasks = task {
                
                cartResponse = tasks as! CartResponse
                
                let sCart : [Shopping_carts] = cartResponse.shopping_carts ?? [Shopping_carts]()
                
                globalCartType = .empty
                
                if(sCart.count > 0){
                    if (sCart[0].product?.first_category_id == 1){
                        globalCartType = .store
                    }else {
                        globalCartType = .service
                    }
                }
                
                print(globalCartType)
            }
            else {
                if let error = error
                {
                    print("mainErr-settings===\(error.localizedDescription)===\(UserDefaults.standard.string(forKey: "AppStatusCode")!)")
                    
                }
            }
            
        })
    }
}

func fetchStoresNow() {
    if (isConnectedToInternet()) {
        // GlobalFunctions.showLoader()
        
        UserDefaults.standard.set(StringIdentifiers.stores, forKey: "webserviceCalledFor")
        UserDefaults.standard.synchronize()
        
        let param = ["pageId":"0"] as [String:Any]
        
        API.callDictionaryAPI(webserviceFor: StringIdentifiers.stores, webMethod: .get, parameters: param, completion: { (error:Error?, task:Any?) in
            
            // GlobalFunctions.dismissLoader()
            
            if let tasks = task {
                
                let storeResponse : StoreResponse  = tasks as! StoreResponse
                
                storesArray = storeResponse.stores ?? [Stores]()
                
                if (storesArray.count>=1) {
                    
                    langArray = storesArray[0].store_languages ?? [Store_languages]()
                    
                    var default_language_id : Int = Int(UserDefaults.standard.string(forKey: "language_id")!)!
                }
                
            }
            else {
                if let error = error
                {
                    print("mainErr-settings===\(error.localizedDescription)===\(UserDefaults.standard.string(forKey: "AppStatusCode")!)")
                    
                    let appStatusCode: String = UserDefaults.standard.string(forKey: "AppStatusCode")!
                    
                    
                }
            }
            
        })
    }
}
extension UIWindow {
    
    /** @return Returns the current Top Most ViewController in hierarchy.   */
    public func topMostWindowController()->UIViewController? {
        
        var topController = rootViewController
        
        while let presentedController = topController?.presentedViewController {
            topController = presentedController
        }
        
        return topController
    }
    
    /** @return Returns the topViewController in stack of topMostWindowController.    */
    public func currentViewController()->UIViewController? {
        
        var currentViewController = topMostWindowController()
        
        while currentViewController != nil && currentViewController is UINavigationController && (currentViewController as! UINavigationController).topViewController != nil {
            currentViewController = (currentViewController as! UINavigationController).topViewController
        }
        
        return currentViewController
    }
}
