//
//  SavedArea.swift
//  T3ALm
//
//  Created by Mohammed Yusuf Mitha on 04/12/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation
//
//  SavedArea.swift
//  Dawaq
//
//  Created by YoussefRomany on 11/6/19.
//  Copyright © 2019 Travellers Guild. All rights reserved.
//

import Foundation


class SavedArea{
    
    static let shared = SavedArea()

    var id : Int = 0
    var titleEN : String = ""
    var titleAR : String = ""
    var fullTitleEN : String = ""
    var fullTitleAR : String = ""
    var hasDelivery : Bool = false
    var cityId : Int = 0
    var cityEN : String = ""
    var cityAR : String = ""
    var countryId : Int = 0
    var countryEN : String = ""
    var countryAR : String = ""
    
    var Title: String? {
        if (isEnglishApp()) {
            return titleEN
        }
        return titleAR
    }
    
    var City: String? {
        if (isEnglishApp()) {
            return cityEN ?? ""
        }
        return cityAR ?? ""
    }
    
    
    init()
    {
        getStoredData()
    }
    
    func storeData(){
        sharedPref.shared.setSharedValue("id", value: self.id )
        sharedPref.shared.setSharedValue("titleEN", value: self.titleEN)
        sharedPref.shared.setSharedValue("titleAR", value: self.titleAR)
        sharedPref.shared.setSharedValue("fullTitleEN", value: self.fullTitleEN)
        sharedPref.shared.setSharedValue("hasDelivery", value: self.hasDelivery)
        sharedPref.shared.setSharedValue("cityId", value: self.cityId)
        sharedPref.shared.setSharedValue("cityEN", value: self.cityEN)
        sharedPref.shared.setSharedValue("cityAR", value: self.cityAR)
        sharedPref.shared.setSharedValue("countryId", value: self.countryId)
        sharedPref.shared.setSharedValue("countryEN", value: self.countryEN)
        sharedPref.shared.setSharedValue("countryAR", value: self.countryAR)
        getStoredData()
    }
    
    func getStoredData()
    {
        self.id = sharedPref.shared.getSharedValue(forKey: "id") as? Int ?? 0
        self.titleEN = sharedPref.shared.getSharedValue(forKey: "titleEN") as? String ?? ""
        self.titleAR = sharedPref.shared.getSharedValue(forKey: "titleAR") as? String ?? ""
        self.fullTitleEN = sharedPref.shared.getSharedValue(forKey: "fullTitleEN") as? String ?? ""
        self.hasDelivery = sharedPref.shared.getSharedValue(forKey: "hasDelivery") as? Bool ?? false
        self.cityId = sharedPref.shared.getSharedValue(forKey: "cityId") as? Int ?? 0
        self.cityEN = sharedPref.shared.getSharedValue(forKey: "cityEN") as? String ?? ""
        self.cityAR = sharedPref.shared.getSharedValue(forKey: "cityAR") as? String ?? ""
        self.countryId = sharedPref.shared.getSharedValue(forKey: "countryId") as? Int ?? 0
        self.countryEN = sharedPref.shared.getSharedValue(forKey: "countryEN") as? String ?? ""
        self.countryAR = sharedPref.shared.getSharedValue(forKey: "countryAR") as? String ?? ""

    }
    
    func logout()
    {
        sharedPref.shared.removeValue(forKey: "id")
        sharedPref.shared.removeValue(forKey: "titleEN")
        sharedPref.shared.removeValue(forKey: "titleAR")
        sharedPref.shared.removeValue(forKey: "fullTitleEN")
        sharedPref.shared.removeValue(forKey: "hasDelivery")
        sharedPref.shared.removeValue(forKey: "cityId")
        sharedPref.shared.removeValue(forKey: "cityEN")
        sharedPref.shared.removeValue(forKey: "cityAR")
        sharedPref.shared.removeValue(forKey: "countryId")
        sharedPref.shared.removeValue(forKey: "countryEN")
        sharedPref.shared.removeValue(forKey: "countryAR")
        getStoredData()
    }

}
