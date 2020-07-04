//
//  API.swift
//  T3ALm
//
//  Created by Mohammed Yusuf Mitha on 03/11/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class API: NSObject
{
    class func callDictionaryAPI(webserviceFor:String, webMethod: HTTPMethod, parameters:[String:Any],completion:@escaping (_ error:Error?,_ task:Any?)->Void)
    {
        
        
        let myUserId:String = UserDefaults.standard.string(forKey: "userId") ?? "0"
        
        
        var url = ""
        
        
        if (webserviceFor==StringIdentifiers.GetCouponDetails) {
            url = "\(Webservices.GetCouponDetails)\(parameters["couponCode"] as! String)"
        }
        if (webserviceFor==StringIdentifiers.postIssue) {
            url = Webservices.postIssueURL
        }
        if(webserviceFor == StringIdentifiers.guestUserLogin){
            url = Webservices.guestUserLoginURL
        }
        if (webserviceFor==StringIdentifiers.disLike) {
            url = Webservices.shoppingCartURL
            url = "\(url)/2/\(parameters["productId"]!)/\(myGlobalUserId)"
        }
        if (webserviceFor==StringIdentifiers.RedeemCoupon) {
            url = "\(Webservices.RedeemCoupon)\(parameters["id"] as! String)"
        }
        
        if (webserviceFor==StringIdentifiers.make_register) {
            url = Webservices.registerURL
        }
       
        if (webserviceFor==StringIdentifiers.make_login) {
            url = Webservices.loginUrl
        }
        
        if (webserviceFor==StringIdentifiers.edit_user) {
            url = "\(Webservices.registerURL)/\(myUserId)"
        }
        
        
        if (webserviceFor==StringIdentifiers.token) {
            url = "\(Webservices.tokenURL)?customer_id=\(parameters["customer_id"] as! String)&device_type=\(parameters["device_type"] as! Int)&device_id=\(parameters["device_id"] as! String)&token=\(parameters["token"] as! String)"
            
            url = url.replacingOccurrences(of: "customer_id=0&", with: "&")
        }
        
        if (webserviceFor==StringIdentifiers.categories) {
            url = Webservices.categoriesURL
        }//categoryDetails
        if (webserviceFor==StringIdentifiers.categoryDetails) {
            url = Webservices.categoriesURL + "/\(parameters["Id"]!)"
         }
        if (webserviceFor==StringIdentifiers.countries) {
            url = Webservices.countriesURL
        }
        
        if (webserviceFor==StringIdentifiers.vendors) {
            url = Webservices.vendorsURL
        }
        if (webserviceFor==StringIdentifiers.vendorDetails) {
            url = "\(Webservices.vendorsURL)/\(parameters["vendor_id"] ?? 0)"
         }
        if (webserviceFor==StringIdentifiers.products) {
            
            
            url = Webservices.productsURL
            if ("\(parameters["product_id"]!)" == "0") {
                
            } else {
                url = "\(url)/\(parameters["product_id"]!)"
            }
            
            
        }
        
        if (webserviceFor==StringIdentifiers.send_password) {
            url = Webservices.forgotPasswordUrl
            if ("\(parameters["email"]!)".isEmpty) { } else {
                url = "\(url)?email=\(parameters["email"]!)"
             }
        }
        
        if (webserviceFor==StringIdentifiers.who_bought_products) {
            url = Webservices.alsoBoughtURL
            if ("\(parameters["product_id"]!)" == "0") { } else {
                url = url.replacingOccurrences(of: "XXX", with: "\(parameters["product_id"]!)")
            }
        }
        
        if (webserviceFor==StringIdentifiers.related_products) {
            url = Webservices.relatedProductsURL
            if ("\(parameters["product_id"]!)" == "0") { } else {
                url = url.replacingOccurrences(of: "XXX", with: "\(parameters["product_id"]!)")
            }
        }
        
 
        
        if (webserviceFor==StringIdentifiers.slider) {
            url = Webservices.slidersURL
        }
        
        if (webserviceFor==StringIdentifiers.user_data) {
            url = "\(Webservices.registerURL)/\(myUserId)"
        }
        
        if (webserviceFor==StringIdentifiers.staticPages) {
            url = Webservices.staticPagesURL
        }
        
        if (webserviceFor==StringIdentifiers.states) {
            url = Webservices.statesURL
            if ("\(parameters["countryId"]!)" == "0") { } else {
                url = Webservices.statesURL.replacingOccurrences(of: "XXX", with: "\(parameters["countryId"]!)")
            }
        }
        
        if (webserviceFor==StringIdentifiers.add_address) {
            url = Webservices.addAddressURL
        }
        
        if (webserviceFor==StringIdentifiers.privateMessages) {
            url = Webservices.privateMessagesURL
        }
        if (webserviceFor==StringIdentifiers.sendPrivateMessages) {
            url = Webservices.privateMessagesURL + "/0"
        }
 
        if (webserviceFor==StringIdentifiers.delete_address) {
            url = Webservices.addAddressURL
            if ("\(parameters["id"]!)" == "0") { } else {
                url = "\(url)/\(parameters["id"]!)"
            }
        }
        
        if (webserviceFor==StringIdentifiers.contactUsRequest) {
            url = Webservices.contactUsURL
        }
 
        if (webserviceFor==StringIdentifiers.getIssues) {
            url = Webservices.getIssuesURL
        }
        if (webserviceFor==StringIdentifiers.product_add_cart) {
            url = Webservices.shoppingCartURL
        }
        
        if (webserviceFor==StringIdentifiers.product_edit_cart) {
            url = Webservices.shoppingCartURL
            if ("\(parameters["cart_id"]!)" == "0") { } else {
                url = "\(url)/\(parameters["cart_id"]!)"
            }
        }
        
        if (webserviceFor==StringIdentifiers.shopping_cart) {
            url = "\(Webservices.shoppingCartURL)/\(myGlobalUserId)"
        }
        
        if (webserviceFor==StringIdentifiers.delete_cart) {
            url = Webservices.shoppingCartURL
            if ("\(parameters["id"]!)" == "0") { } else {
                url = "\(url)/\(parameters["id"]!)"
            }
        }
        
      
        
        if (webserviceFor==StringIdentifiers.change_password) {
            url = "\(Webservices.changePasswordURL)?customer_id=\(parameters["customer_id"]!)&old_password=\(parameters["old_password"]!)&new_password=\(parameters["new_password"]!)"
        }
        
        if (webserviceFor==StringIdentifiers.stores) {
            url = Webservices.storesURL
        }
        
        if (webserviceFor==StringIdentifiers.my_orders) {
            url = Webservices.ordersURL
        }
        
        if (webserviceFor==StringIdentifiers.reward_points) {
            url = Webservices.rewardsPointsURL
        }
        
        if (webserviceFor==StringIdentifiers.guestcustomers) {
            url = Webservices.guestcustomersURL
        }
        if (webserviceFor==StringIdentifiers.shippingOptions) {
            url = Webservices.shippingOptionsURL + "/\(parameters["id"]!)"
        }
        
        var webParams:[String:Any] = parameters as [String:Any]
        
        let commonParams = [:] as [String: Any]
        
        if (webserviceFor != StringIdentifiers.make_register || webserviceFor != StringIdentifiers.edit_user || webserviceFor != StringIdentifiers.add_address || webserviceFor != StringIdentifiers.sendPrivateMessages || webserviceFor != StringIdentifiers.make_order || webserviceFor != StringIdentifiers.edit_address || webserviceFor != StringIdentifiers.contactUsRequest || webserviceFor != StringIdentifiers.product_add_cart || webserviceFor != StringIdentifiers.product_edit_cart || webserviceFor != StringIdentifiers.change_password ) {
             webParams.merge(commonParams, uniquingKeysWith: {(first, _) in first })
        }
        
        var passedParameters = ""
        
        for (key,value) in webParams {
            passedParameters = "\(passedParameters)&\(key)=\(value)"
        }
        
        
        
        
        var headers : HTTPHeaders = [:]
        
        headers = [
            "Authorization": token
         ]
        
       
        var myEncoding : ParameterEncoding = CustomGetEncoding()
        if (webMethod==HTTPMethod.post && (webserviceFor != StringIdentifiers.sendPrivateMessages && webserviceFor != StringIdentifiers.send_password && webserviceFor != StringIdentifiers.make_register && webserviceFor != StringIdentifiers.edit_user && webserviceFor != StringIdentifiers.add_address && webserviceFor != StringIdentifiers.change_password && webserviceFor != StringIdentifiers.make_order && webserviceFor != StringIdentifiers.edit_address && webserviceFor != StringIdentifiers.contactUsRequest && webserviceFor != StringIdentifiers.product_add_cart && webserviceFor != StringIdentifiers.token)) {
             myEncoding  = CustomPostEncoding()
        } else if (webserviceFor == StringIdentifiers.send_password || webserviceFor == StringIdentifiers.make_register || webserviceFor == StringIdentifiers.edit_user || webserviceFor == StringIdentifiers.add_address || webserviceFor == StringIdentifiers.sendPrivateMessages || webserviceFor == StringIdentifiers.change_password || webserviceFor == StringIdentifiers.make_order || webserviceFor == StringIdentifiers.edit_address || webserviceFor == StringIdentifiers.contactUsRequest || webserviceFor == StringIdentifiers.product_add_cart || webserviceFor == StringIdentifiers.product_edit_cart || webserviceFor == StringIdentifiers.token || webserviceFor == StringIdentifiers.postIssue || webserviceFor == StringIdentifiers.guestUserLogin){
             myEncoding  = JSONEncoding.default
        }
        
        
        if (webserviceFor==StringIdentifiers.make_register || webserviceFor==StringIdentifiers.edit_user) {
            myEncoding = JSONEncoding.default
        }
        
        
        var finalWebParams : [String : Any]
        var webParams2 : [String : Any] = [String : Any]()
        var webParams3 : [String : Any] = [String : Any]()
        if (webserviceFor==StringIdentifiers.make_register || webserviceFor==StringIdentifiers.edit_user || webserviceFor==StringIdentifiers.add_address || webserviceFor==StringIdentifiers.make_order || webserviceFor==StringIdentifiers.edit_address || webserviceFor==StringIdentifiers.contactUsRequest || webserviceFor==StringIdentifiers.edit_address || webserviceFor==StringIdentifiers.product_add_cart || webserviceFor==StringIdentifiers.product_edit_cart || webserviceFor == StringIdentifiers.sendPrivateMessages || webserviceFor == StringIdentifiers.postIssue || webserviceFor == StringIdentifiers.guestUserLogin) {
            webParams2 = parameters["obj001"]! as! [String : Any]
            
            if (webserviceFor==StringIdentifiers.edit_address) {
                webParams3 = webParams2["address"] as! [String : Any]
            }
            
        }
        
        if (webserviceFor==StringIdentifiers.edit_address) {
            url = "\(Webservices.addAddressURL)/\(webParams3["id"]!)"
        }
        
        if (webserviceFor==StringIdentifiers.make_register || webserviceFor==StringIdentifiers.edit_user || webserviceFor==StringIdentifiers.add_address || webserviceFor==StringIdentifiers.make_order || webserviceFor==StringIdentifiers.edit_address || webserviceFor==StringIdentifiers.contactUsRequest || webserviceFor==StringIdentifiers.product_add_cart || webserviceFor==StringIdentifiers.product_edit_cart || webserviceFor == StringIdentifiers.sendPrivateMessages || webserviceFor == StringIdentifiers.postIssue || webserviceFor == StringIdentifiers.guestUserLogin) {
            finalWebParams = webParams2
        } else {
            finalWebParams = webParams
        }
        
        if (webserviceFor==StringIdentifiers.product_add_cart) {
            if(webMethod == .put){
                let t = finalWebParams["shopping_cart_item"] as? [String : Any]
                url = "\(url)/\(t?["id"] ?? 0)"
            }
            
        }
        if (webserviceFor==StringIdentifiers.settings) {
            url = Webservices.settingsURL
             finalWebParams = [:]
        }
        if (webserviceFor==StringIdentifiers.city) {
            url = Webservices.countriesURL + "/143/stateprovinces/0"
            finalWebParams = [:]
            headers = [
                      "Authorization": token,
                      "Accept-Language": "\(UserDefaults.standard.string(forKey: "language_code")!)"
                  ]
        }
        
        if (webserviceFor==StringIdentifiers.area) {
            url = Webservices.countriesURL + "/143/stateprovinces/\(parameters["city_id"]!)"

            finalWebParams = [:]
            headers = [
                "Authorization": token,
                "Accept-Language": "\(UserDefaults.standard.string(forKey: "language_code")!)"
            ]
        }
        if (webserviceFor==StringIdentifiers.my_address) {
            url = localWebserviceURL + "/customers/\(myGlobalUserId)?fields=addresses"
             finalWebParams = [:]
            headers = [
                "Authorization": token,
                "Accept-Language": "\(UserDefaults.standard.string(forKey: "language_code")!)"
            ]
        }
        if (webserviceFor==StringIdentifiers.deletePrivateMessages) {
            url = Webservices.privateMessagesURL
            ///customers/\(myGlobalUserId)/private_messages
            //customers/1/private_messages/1
            url = url + "/\(parameters["ids"] ?? "")"
            finalWebParams = [:]
        }
        if (webserviceFor==StringIdentifiers.paymentMethods) {
            url = Webservices.paymentMethodsURL
            url = url + "/\(parameters["country_id"]!)"
            finalWebParams = [:]
        }
        if (webserviceFor==StringIdentifiers.orderHeaders) {
            url = Webservices.orderHeadersURL
            finalWebParams = [:]
        }
      
        
        print("finalWebParams===\(finalWebParams)")
        print("passedParameters===\(passedParameters)")
        print("webserviceFor===\(webserviceFor)==\(url)===\(webParams)")
        print("headers==\(headers)")
        
        AF.request(url, method: webMethod, parameters: finalWebParams, encoding: myEncoding, headers: headers)
            .responseJSON { (response) in
                print(response)
                if (response.response == nil) {
                    UserDefaults.standard.set("-1001", forKey: "AppStatusCode")
                    UserDefaults.standard.synchronize()
                    
                    if let jsonErr = response.error {
                        completion(jsonErr, nil)
                    }
                    
                } else {
                    
                    
                    if ((response.response?.statusCode)!>=200 && (response.response?.statusCode)!<=300) {
                        print("response.result===\(response.result)")
                        switch response.result
                        {
                        case .failure(let error):
                            print("completion:block===002==\(webserviceFor)")
                            
                            if (error._code==NSURLErrorTimedOut) {
                                
                                UserDefaults.standard.set("-1001", forKey: "AppStatusCode")
                                UserDefaults.standard.synchronize()
                                
                                completion(error, nil)
                                
                            } else {
                            
                                if (webserviceFor==StringIdentifiers.send_password) {
                                    var regResp : RegisterResponse = RegisterResponse()
                                    completion(nil, regResp)
                                } else {
                                    
                                    print("\n\n===========Error===========")
                                    print("Error Code: \(error._code)")
                                    print("Error Messsage: \(error.localizedDescription)")
                                    if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
                                        print("Server Error: " + str)
                                    }
                                    debugPrint(error as Any)
                                    print("===========================\n\n")
                                    
                                    UserDefaults.standard.set("\((response.response?.statusCode)!)", forKey: "AppStatusCode")
                                    UserDefaults.standard.synchronize()
                                    
                                    completion(error, nil)
                                }
                            }
                            
                            
                            
                        case .success(let value):
                            print("webResponse=1==\(webserviceFor)====\(value)")

                            let data = response.data
                            print(data)

                            do {
                                
                                //                                                             }
                                //                                if (webserviceFor==StringIdentifiers.GetCouponDetails) {
                                //                                    let commentsData = try JSONDecoder().decode(CouponDetails.self, from: data!)
                                //                                    completion(nil, commentsData)
                                //                                }
                                //
                                //                                if (webserviceFor==StringIdentifiers.RedeemCoupon) {
                                //                                    let commentsData = try JSONDecoder().decode(CouponDetails.self, from: data!)
                                //                                    completion(nil, commentsData)
                                //                                }
                                //
                                if (webserviceFor==StringIdentifiers.make_register) {
                                    let commentsData = try JSONDecoder().decode(RegisterResponse.self, from: data!)
                                    completion(nil, commentsData)
                                }

                                if (webserviceFor==StringIdentifiers.contactUsRequest) {
                                    let commentsData = try JSONDecoder().decode(ContactUsModel.self, from: data!)
                                    completion(nil, commentsData)
                                }

                                if (webserviceFor==StringIdentifiers.paymentMethods) {
                                    let commentsData = try JSONDecoder().decode(paymentMethodsModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                if (webserviceFor==StringIdentifiers.guestUserLogin) {
                                    let commentsData = try JSONDecoder().decode(LoginModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                if (webserviceFor==StringIdentifiers.product_add_cart) {
                                    let commentsData = try JSONDecoder().decode(CartResponse.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                
                                if (webserviceFor==StringIdentifiers.reOrder) {
                                    let commentsData = try JSONDecoder().decode(CartResponse.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                
                                if (webserviceFor==StringIdentifiers.product_edit_cart) {
                                    let commentsData = try JSONDecoder().decode(CartResponse.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                if (webserviceFor==StringIdentifiers.orderHeaders) {
                                    let commentsData = try JSONDecoder().decode(ordersHeadersModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                if (webserviceFor==StringIdentifiers.shopping_cart) {
                                    let commentsData = try JSONDecoder().decode(CartResponse.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                if (webserviceFor==StringIdentifiers.privateMessages) {
                                    let commentsData = try JSONDecoder().decode(PrivateMessagesModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                if (webserviceFor==StringIdentifiers.sendPrivateMessages) {
                                    let commentsData = try JSONDecoder().decode(PrivateMessagesModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                if (webserviceFor==StringIdentifiers.add_address) {
                                    let commentsData = try! JSONDecoder().decode(Addresses.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                if (webserviceFor==StringIdentifiers.city) {
                                    let commentsData = try JSONDecoder().decode(State_provincesModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                if (webserviceFor==StringIdentifiers.area) {
                                    let commentsData = try JSONDecoder().decode(CityModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                //
                                if (webserviceFor==StringIdentifiers.change_password) {
                                    // let commentsData = try JSONDecoder().decode(Customers.self, from: data!)
                                    var customersXX : Customers = Customers()
                                    completion(nil, customersXX)
                                }
                                
                                if (webserviceFor==StringIdentifiers.make_order) {
                                    // let commentsData = try JSONDecoder().decode(StringResponse.self, from: data!)
                                    // completion(nil, commentsData)
                                    let globalErrObj = StringResponse.init(Id: value as? Int, Id2: value as? String)
                                    completion(nil, globalErrObj)
                                }
                                
                                if (webserviceFor==StringIdentifiers.edit_address) {
                                    let commentsData = try JSONDecoder().decode(Addresses.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                if (webserviceFor==StringIdentifiers.my_address) {
                                    let commentsData = try JSONDecoder().decode(CustomersMainModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                //
                                if (webserviceFor==StringIdentifiers.make_login) {
                                    let commentsData = try JSONDecoder().decode(RegisterResponse.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                //
                                if (webserviceFor==StringIdentifiers.edit_user) {
                                    let commentsData = try JSONDecoder().decode(RegisterResponse.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                //
                                //                                if (webserviceFor==StringIdentifiers.token) {
                                //                                    let globalErrObj = StringResponse.init(Id: value as? Int, Id2: value as? String)
                                //                                    completion(nil, globalErrObj)
                                //                                }
                                //
                                if (webserviceFor==StringIdentifiers.categories) {
                                    let commentsData = try JSONDecoder().decode(Categories.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                if (webserviceFor==StringIdentifiers.categoryDetails) {
                                    let commentsData = try JSONDecoder().decode(Categories.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                //
                                if (webserviceFor==StringIdentifiers.countries) {
                                    let commentsData = try JSONDecoder().decode(CountriesModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                
//                                if (webserviceFor==StringIdentifiers.states) {
//                                    let commentsData = try JSONDecoder().decode(AreaModel.self, from: data!)
//                                    completion(nil, commentsData)
//                                }
                                //
                                //                                if (webserviceFor==StringIdentifiers.vendors) {
                                //                                    let commentsData = try JSONDecoder().decode(VendorsModel.self, from: data!)
                                //                                    completion(nil, commentsData)
                                //                                }
                                //
                                if (webserviceFor==StringIdentifiers.products) {
                                    let commentsData = try JSONDecoder().decode(Products.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                //
                                if (webserviceFor==StringIdentifiers.who_bought_products) {
                                    let commentsData = try JSONDecoder().decode(Products.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                //
                                if (webserviceFor==StringIdentifiers.related_products) {
                                    let commentsData = try JSONDecoder().decode(Products.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                //
                                if (webserviceFor==StringIdentifiers.slider) {
                                    let commentsData = try JSONDecoder().decode(SliderMainModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                
                                if (webserviceFor==StringIdentifiers.user_data) {
                                    let commentsData = try JSONDecoder().decode(CustomersMainModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                
                                if (webserviceFor==StringIdentifiers.staticPages) {
                                    let commentsData = try JSONDecoder().decode(StaticPagesModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                
                                if (webserviceFor==StringIdentifiers.getIssues) {
                                    let commentsData = try JSONDecoder().decode(IssuesModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                if (webserviceFor==StringIdentifiers.postIssue) {
                                    let commentsData = try JSONDecoder().decode(responseModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                
                                if (webserviceFor==StringIdentifiers.delete_address) {
                                    let commentsData = try JSONDecoder().decode(Addresses.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                
                                if (webserviceFor==StringIdentifiers.delete_cart) {
                                    let commentsData = try JSONDecoder().decode(Addresses.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                
                                if (webserviceFor==StringIdentifiers.send_password) {
                                    //                                    let globalErrObj = StringResponse.init(Id: value as? Int, Id2: value as? String)
                                    //                                    completion(nil, globalErrObj)
                                    //                                    let commentsData = try JSONDecoder().decode(Addresses.self, from: data!)
                                    completion(nil, nil)
                                }
                                //
                                if (webserviceFor==StringIdentifiers.stores) {
                                    let commentsData = try JSONDecoder().decode(StoreResponse.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                
                                if (webserviceFor==StringIdentifiers.my_orders) {
                                    let commentsData = try JSONDecoder().decode(MyOrdersModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                if (webserviceFor==StringIdentifiers.vendors) {
                                    let commentsData = try JSONDecoder().decode(vendorsModel.self, from: data!)
                                    completion(nil, commentsData)
                                    
                                }
                                if (webserviceFor==StringIdentifiers.disLike) {
                                    
                                    completion(nil, [])
                                }
                                if (webserviceFor==StringIdentifiers.vendorDetails) {
                                    let commentsData = try JSONDecoder().decode(vendorsModel.self, from: data!)
                                    completion(nil, commentsData)
                                    
                                }
                                if (webserviceFor==StringIdentifiers.order_details) {
                                    let commentsData = try JSONDecoder().decode(OrderDetailsModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                //
                                //                                if (webserviceFor==StringIdentifiers.reward_points) {
                                //                                    let commentsData = try JSONDecoder().decode(RewardPointsModel.self, from: data!)
                                //                                    completion(nil, commentsData)
                                //                                }
                                //
                                if (webserviceFor==StringIdentifiers.guestcustomers) {
                                    let commentsData = try JSONDecoder().decode(CustomersMainModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                if (webserviceFor==StringIdentifiers.shippingOptions) {
                                    let commentsData = try JSONDecoder().decode(ShippingOptionsModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                
                                if (webserviceFor==StringIdentifiers.settings) {
                                    let commentsData = try JSONDecoder().decode(SettingModel.self, from: data!)
                                    completion(nil, commentsData)
                                }
                                if (webserviceFor==StringIdentifiers.deletePrivateMessages) {
                                     completion(nil, 1)
                                }
                            } catch let jsonErr {
                                print("jsonErr=1==\(jsonErr)")
                                UserDefaults.standard.set("\((response.response?.statusCode)!)", forKey: "AppStatusCode")
                                UserDefaults.standard.synchronize()
                                
                                completion(jsonErr, nil)
                            }
                        }
                    } else {
                        
                        
 
                        dismissLoader()
                        
                        let myStatusCode: String = "\((response.response?.statusCode)!)"
                        
                        print("myStatusCode===\(myStatusCode)")
                        
                        if (myStatusCode=="1001") {
                            
                            showToast(toastView: (UIApplication.shared.keyWindow?.currentViewController()?.view)!, toastTitle: "myErr".localized(), toastText: "someErr".localized())
                            
                        } else if (myStatusCode=="400" || myStatusCode=="404") {
                            
                            var myTextToShow : String = ""
                            
                            dismissLoader()
                            // GlobalFunctions.showToast(toastView: (UIApplication.shared.keyWindow?.currentViewController()?.view)!, toastTitle: "myErr".localized(), toastText: "someErr".localized())
                            if (webserviceFor==StringIdentifiers.make_register || webserviceFor==StringIdentifiers.send_password) {
                                let data = response.data
                                do {
                                    
                                    var utf8Text = String(data: data!, encoding: .utf8)
                                    
                                    utf8Text = utf8Text!.replacingOccurrences(of: "\r", with: "")
                                    utf8Text = utf8Text!.replacingOccurrences(of: "\n", with: "")
                                    utf8Text = utf8Text!.replacingOccurrences(of: "\t", with: "")
                                    utf8Text = utf8Text!.replacingOccurrences(of: "\"", with: "")
                                    
                                    print("utf8Text=2===\(utf8Text!)")
                                    
                                    var nArr1 = utf8Text!.split(separator: "]")
                                    
                                    if (nArr1.count>=1) {
                                        utf8Text = "\(nArr1[0])"
                                        
                                        print("utf8Text=3===\(utf8Text!)")
                                        
                                        var nArr2 = utf8Text!.split(separator: "[")
                                        
                                        if (nArr2.count>=2) {
                                            utf8Text = "\(nArr2[1])"
                                        }
                                        
                                    }
                                    
                                    utf8Text = utf8Text!.trimmingCharacters(in: .whitespacesAndNewlines)
                                    
                                    
                                    myTextToShow = utf8Text!
                                    
                                    if (webserviceFor == StringIdentifiers.make_login) {
                                        var tt001 : RegisterResponse = RegisterResponse()
                                        var tt002 : Customers = Customers()
                                        tt002.id = -1
                                        var tt003 : [Customers] = [tt002]
                                        tt001.customers = tt003
                                        completion(nil, tt001)
                                    }
                                    
                                }  catch let jsonErr {
                                    print("jsonErr=2==\(jsonErr)")
                                    UserDefaults.standard.set("\((response.response?.statusCode)!)", forKey: "AppStatusCode")
                                    UserDefaults.standard.synchronize()
                                    
                                    completion(jsonErr, nil)
                                }
                                //                            } else {
                                //                                myTextToShow = "someErr".localized()
                                //                            }
                                
                                showToast(toastView: (UIApplication.shared.keyWindow?.currentViewController()?.view)!, toastTitle: "myErr".localized(), toastText: myTextToShow)
                                
                                
                                
                            } else {
                                
                                UserDefaults.standard.set("\((response.response?.statusCode)!)", forKey: "AppStatusCode")
                                UserDefaults.standard.synchronize()
                                
                                if let jsonErr = response.error {
                                     completion(jsonErr, nil)
                                } else if (webserviceFor==StringIdentifiers.make_login) {
                                     let jsonErr = NSError(domain:"", code:(response.response?.statusCode)!, userInfo:nil)
                                    completion(jsonErr, nil)
                                } else {
                                     var myTextToShow : String = ""
                                    let data = response.data
                                    do {
                                        
                                        // let globalErrObj = try JSONDecoder().decode([String : String].self, from: data!).map(StringKeyValueModel.init)
                                        
                                        print("fapaaaa==\(response.data)")
                                        
                                        var utf8Text = String(data: data!, encoding: .utf8)
                                        
                                        utf8Text = utf8Text!.replacingOccurrences(of: "\r", with: "")
                                        utf8Text = utf8Text!.replacingOccurrences(of: "\n", with: "")
                                        utf8Text = utf8Text!.replacingOccurrences(of: "\t", with: "")
                                        utf8Text = utf8Text!.replacingOccurrences(of: "\"", with: "")
                                        
                                        print("utf8Text=22===\(utf8Text!)")
                                        
                                        var nArr1 = utf8Text!.split(separator: "]")
                                        
                                        if (nArr1.count>=1) {
                                            utf8Text = "\(nArr1[0])"
                                            
                                            print("utf8Text=33===\(utf8Text!)")
                                            
                                            var nArr2 = utf8Text!.split(separator: "[")
                                            
                                            if (nArr2.count>=2) {
                                                utf8Text = "\(nArr2[1])"
                                            }
                                            
                                        }
                                        
                                        utf8Text = utf8Text!.trimmingCharacters(in: .whitespacesAndNewlines)
                                        
                                        
                                        myTextToShow = utf8Text!
                                        
                                        showToast(toastView: (UIApplication.shared.keyWindow?.currentViewController()?.view)!, toastTitle: "myErr".localized(), toastText: myTextToShow)
                                        
                                    }  catch let jsonErr {
                                        print("jsonErr=3==\(jsonErr)")
                                        UserDefaults.standard.set("\((response.response?.statusCode)!)", forKey: "AppStatusCode")
                                        UserDefaults.standard.synchronize()
                                        
                                        completion(jsonErr, nil)
                                    }
                                }
                            }
                        }
                    }
                }
        }
        
    }
}


func loginForGuest(completion:@escaping (_ success : Bool)->Void)
{
    let url = "192.168.8.103/citizen/api/user/login"

 
}
struct CustomGetEncoding: ParameterEncoding {
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try URLEncoding().encode(urlRequest, with: parameters)
        request.url = URL(string: request.url!.absoluteString.replacingOccurrences(of: "%5B%5D=", with: "="))
        return request
    }
}

struct CustomPostEncoding: ParameterEncoding {
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try URLEncoding().encode(urlRequest, with: parameters)
        let httpBody = NSString(data: request.httpBody!, encoding: String.Encoding.utf8.rawValue)!
        request.httpBody = httpBody.replacingOccurrences(of: "%5B%5D=", with: "=").data(using: .utf8)
        return request
    }
    
    
}

private let arrayParametersKey = "arrayParametersKey"

/// Extenstion that allows an array be sent as a request parameters
extension Array {
    /// Convert the receiver array to a `Parameters` object.
    func asParameters() -> Parameters {
        return [arrayParametersKey: self]
    }
}


/// Convert the parameters into a json array, and it is added as the request body.
/// The array must be sent as parameters using its `asParameters` method.
struct ArrayEncoding: ParameterEncoding {
    
    /// The options for writing the parameters as JSON data.
    public let options: JSONSerialization.WritingOptions
    
    
    /// Creates a new instance of the encoding using the given options
    ///
    /// - parameter options: The options used to encode the json. Default is `[]`
    ///
    /// - returns: The new instance
    public init(options: JSONSerialization.WritingOptions = []) {
        self.options = options
    }
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var urlRequest = try urlRequest.asURLRequest()
        
        guard let parameters = parameters,
            let array = parameters[arrayParametersKey] else {
                return urlRequest
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: array, options: options)
            
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
            
            urlRequest.httpBody = data
            
        } catch {
            throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
        }
        
        return urlRequest
    }
}
func upload(images: [String:[UIImage]] , to url: String, params: [String: Any]) {
    
    let headers : HTTPHeaders = [
        "Authorization": token,
        "Accept-Language": "\(UserDefaults.standard.string(forKey: "language_code") ?? "en" )",
        "Accept-Currency": "\(UserDefaults.standard.string(forKey: "currency_code")!)"
    ]
    AF.upload(multipartFormData: { multiPart in
       
        for (_key,_imgs) in images {
            for img in _imgs {
                let data = img.jpegData(compressionQuality: 0.2) ?? Data()
                multiPart.append(data, withName: _key, fileName: "image.jpeg", mimeType: "image/jpeg")
                print("mrmr", _key, img)
            }
        }

        
    }, to: url ,method: .post, headers: headers)
        .uploadProgress(queue: .main, closure: { progress in
            //Current upload progress of file
            print("Upload Progress: \(progress.fractionCompleted)")
        })
        .responseJSON(completionHandler: { data in
            //Do what ever you want to do with response
        })
}


/// use this method to connect to any web service and upload files to it
///
/// - Parameters:
///   - images: the images you want to upload to server must be in this format [key:image] , the key is the parameter name in the webservice and because it's array you must put [] after the name
///   - api: the api name that you want to send/get data , and should be variable in ApiNames struct
///   - parm: the parameters that you want to send to the api , default value is ni
///   - id: the id of the request to get it back in the deleget , it can be any string , default value is empty string
func connectToUploadObject(images: [String:[UIImage]] = [:], withParameters parm:[String:String]? = nil , toApi api:String, andIdentifier id:String = "", fromController controller: UIViewController,completion:@escaping (_ error:Error?,_ task:Any?)->Void)
{
    
 
    
    let headers : HTTPHeaders = [
        "Authorization": token,
        "Accept-Language": "\(UserDefaults.standard.string(forKey: "language_code") ?? "en" )",
        "Accept-Currency": "\(UserDefaults.standard.string(forKey: "currency_code")!)"
    ]
    
    AF.upload(multipartFormData: { multipart in
        //loop all parameters to convert it to data and append it to the request
        for (_key,_value) in parm ?? [:] {
            multipart.append(_value.data(using: .utf8) ?? Data(), withName: _key)
        }
        
        for (_key,_imgs) in images {
            for img in _imgs {
                let data = img.jpegData(compressionQuality: 0.2) ?? Data()
                multipart.append(data, withName: _key, fileName: "image.jpeg", mimeType: "image/jpeg")
                print("mrmr", _key, img)
            }
        }
        }, to: api, usingThreshold: UInt64.init(), method: .post, headers: headers)
        .uploadProgress(queue: .main, closure: { (Progress) in
            print("Upload Progress: \(Progress.fractionCompleted)")
        }).response { (response) in
            
            if (response.response == nil) {
                UserDefaults.standard.set("-1001", forKey: "AppStatusCode")
                UserDefaults.standard.synchronize()
                
                if let jsonErr = response.error {
                    completion(jsonErr, nil)
                }
                
            } else {
                
                
                     print("response.result===\(response.result)")
                    switch response.result
                    {
                        case .failure(let error):
                            print("\n\n\n===========Error===========")
                            
                            
                            if (error._code==NSURLErrorTimedOut) {
                                print("----Timed Out Error ----")
                                
                                UserDefaults.standard.set("-1001", forKey: "AppStatusCode")
                                UserDefaults.standard.synchronize()
                                completion(error, nil)
                                
                            } else {
                                
                                print("Error Code: \(error._code)")
                                print("Error Messsage: \(error.localizedDescription)")
                                
                                if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
                                    print("Server Error: " + str)
                                }
                                debugPrint(error as Any)
                                print("===========================\n\n\n")
                                
                                UserDefaults.standard.set("\((response.response?.statusCode)!)", forKey: "AppStatusCode")
                                UserDefaults.standard.synchronize()
                                
                                completion(error, nil)
                            }
                            break
                        
                        
                        
                        case .success(let value):
                            
                            guard let data = response.data else { return }
                            do{
                                let imageModel = try JSONDecoder().decode(ImagesModel.self, from: data)
                                completion(nil, imageModel)

                            }catch let error{
                                print(error)
                                completion(error, nil)
                            }
                            break
                    }
                 
            }
    }
}




struct ImagesModel : Codable {
    let uploaded_files : [Uploaded_files]?
    
    
}
 struct Uploaded_files : Codable {
    let attachment_files_paths : [String]?
    let id : Int?
}
