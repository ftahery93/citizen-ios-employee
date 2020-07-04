//
//  IPPlace.swift
//  T3ALm
//
//  Created by Mohammed Yusuf Mitha on 11/11/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation
import CoreLocation

struct IPPlace {
    let city: String?
    let countryCode: String?
    let countryName: String?
    let ip: String?
    let isp: String?
    let coordinates: CLLocationCoordinate2D?
    let organization: String?
    let regionCode: String?
    let regionName: String?
    let timezone: String?
    let zipCode: String?
}
struct Place{
    let placemark           : CLPlacemark?
    let name                : String?
    let coordinates         : CLLocationCoordinate2D?
    let state               : String?
    let county              : String?
    let neighborhood        : String?
    let city                : String?
    let country             : String?
    let isoCountryCode      : String?
    let postalCode          : String?
    let streetNumber        : String?
    let streetAddress       : String?
    let formattedAddress    : String?
    let areasOfInterest     : [String]?
    let region              : CLRegion?
    let timezone            : TimeZone?
    let postalAddress       : Any?
    let addressDictionary   : [AnyHashable: Any]?
}
