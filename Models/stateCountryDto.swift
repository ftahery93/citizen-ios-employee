//
//  stateCountryDto.swift
//  T3ALm
//
//  Created by Mohammed Yusuf Mitha on 25/11/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation
struct stateCountryDto: Encodable, Decodable{
    var stateCountryDto : data
    
}

struct data:Encodable, Decodable{
    var city_id : Int
    var city_name : String
    var country_id : Int
    var countryt_name : String
    var id : Int
    var stateProvince_id : Int
    var state_name : String
}
