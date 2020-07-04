//
//  Constants.swift
//  T3ALm
//
//  Created by Mohammed Yusuf Mitha on 29/10/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation
import UIKit

let widthFactor : CGFloat = screenWidth/1080.0

let iPhoneFactorX = widthFactor*3

var globalSelectedAddress : Addresses = Addresses(first_name: nil,
                                                  last_name: nil,
                                                  email: nil,
                                                  company: nil,
                                                  country_id: nil,
                                                  country: nil,
                                                  parent_state_province_id: nil,
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
                                                  parent_province: nil,
                                                  province: nil,
                                                  is_default: nil,
                                                  id: 0)
var globalSelectedShippingOption : Shipping_options?

var globalUserObject : Customers!{
    didSet{
        myGlobalUserId = globalUserObject.id!
    }
}
let myGreenColor : UIColor = UIColor(red: 112/255, green: 164/255, blue: 142/255, alpha: 1.0)
let myBackgroundColor : UIColor = UIColor(hexString: "#F5F5F5")
let myBlueColor : UIColor = UIColor(hexString: "#132F53")
let myOrangeColor : UIColor = UIColor(hexString: "#FF5722")


 
var globalOrdersParametersForList : String = "id,created_on_utc,customer_currency_code,order_status,order_total"

var darkGray:String = "#5d5d5d" //dark gray
var ligthGray:String = UIColor.lightGray.toHexString()
var blackColor:String = "#000000" // black color
var orangeColor:String = "#ff7b3b" // orange color
var borderColor:String = "#dedede" // border color
var greenColor:String = "#4f9938" // green color
var placeholderColor:String = "#5d5d5d" // gray placeholder color
var fontColor001:String = "#33383f" // dark blue
var fontColor003:String = "#5d5d5d" //dark gray
var myGlobalUserId:Int = Int(UserDefaults.standard.string(forKey: "userId") ?? "0")!

var globalProductParametersForList : String = "name,localized_names,images,id,se_name,old_price,price,prices_percentage,formatted_price,formatted_old_price,localized_short_descriptions,added_to_wishlist, vendor_id,vendor,first_category_id,average_approved_rating_sum,approved_total_reviews,stock_quantity"
var globalProductListSize : Int = 10
