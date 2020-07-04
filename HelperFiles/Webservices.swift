//
//  Webservices.swift
//  T3ALm
//
//  Created by Mohammed Yusuf Mitha on 05/11/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation
//
//  Webservices.swift
//  TG
//
//  Created by hardtask on 2/2/18.
//  Copyright © 2018 hardtask. All rights reserved.
//

let localWebserviceURL = "http://netlet.hardtask.info/api"
let newURL = "http://192.168.8.103/citizen/api/employee"
import UIKit
struct Webservices {
    static let loginUrl : String = localWebserviceURL + "/customers/login"
    static let forgotPasswordUrl : String = localWebserviceURL + "/customers/recoverypassword"
    static let registerURL = localWebserviceURL + "/customers"
    static let tokenURL = localWebserviceURL + "/customers/devicetoken"
    static let categoriesURL = localWebserviceURL + "/categories"
    static let productsURL = localWebserviceURL + "/products"
    static let slidersURL = localWebserviceURL + "/sliders"
    static let countriesURL = localWebserviceURL + "/countries"
    static let statesURL = localWebserviceURL + "/countries/XXX/StateProvinces"
    static let vendorsURL = localWebserviceURL + "/vendors"
    static let staticPagesURL = localWebserviceURL + "/topics"
    static let contactUsURL = localWebserviceURL + "/contact_us"
    static let shoppingCartURL = localWebserviceURL + "/shopping_cart_items"
    static let addAddressURL = localWebserviceURL + "/customers/\(myGlobalUserId)/addresses"
    static let alsoBoughtURL = localWebserviceURL + "/products/XXX/alsopurchased"
    static let relatedProductsURL = localWebserviceURL + "/products/XXX/related"
    static let ordersURL = localWebserviceURL + "/orders"
    static let changePasswordURL = localWebserviceURL + "/customers/changepassword"
    static let storesURL = localWebserviceURL + "/current_store"
    static let rewardsPointsURL = localWebserviceURL + "/customers/rewardpoints"
    static let guestcustomersURL = localWebserviceURL + "/guestcustomers"
    static let GetCouponDetails = localWebserviceURL + "/cards/\(myGlobalUserId)/"
    static let RedeemCoupon = localWebserviceURL + "/cards/redeemcard/"
    static let settingsURL = localWebserviceURL + "/settings"
    static let aboutUsURL = localWebserviceURL + "/topics"
    static let paymentMethodsURL = localWebserviceURL + "/PaymentMethods"
    static let getAddressURL = localWebserviceURL + "/customers/\(myGlobalUserId)?fields=addresses"
    static let privateMessagesURL = localWebserviceURL + "/customers/\(myGlobalUserId)/private_messages"
    static let shippingOptionsURL = localWebserviceURL + "/shipping_options/\(myGlobalUserId)"
    static let UPLOAD_FILE = localWebserviceURL + "/upload_files"
    static let orderHeadersURL = localWebserviceURL + "/orders_headers?customer_id=\(myGlobalUserId)"
    
    static let guestUserLoginURL = newURL + "/login"
    static let getIssuesURL = newURL + "/getIssues"
    static let postIssueURL = newURL + "/approveIssue"

}
