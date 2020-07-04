//
//  RegisterUser.swift
//  TG
//
//  Created by hardtask on 2/3/18.
//  Copyright © 2018 hardtask. All rights reserved.
//

struct RegisterUser : Decodable {
    var first_name : String?
    var last_name : String?
    var phone_number : String?
    var email : String?
    var username : String?
    var password : String?
    var role_ids : [Int]?
}
