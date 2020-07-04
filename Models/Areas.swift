//
//  Areas.swift
//  T3ALm
//
//  Created by Mohammed Yusuf Mitha on 04/12/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation

struct Areas : Codable {
    let id : Int?
    let titleEN : String?
    let titleAR : String?
    let fullTitleEN : String?
    let fullTitleAR : String?
    let hasDelivery : Bool?
    let cityId : Int?
    let cityEN : String?
    let cityAR : String?
    let countryId : Int?
    let countryEN : String?
    let countryAR : String?
    var Title: String? {
        if (isEnglishApp()) {
            return titleEN ?? ""
        }
        return titleAR ?? ""
    }
    
}
