//
//  GoogleLocationApi.swift
//  T3ALm
//
//  Created by Mohammed Yusuf Mitha on 18/11/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation

import UIKit
import SwiftLocation
import CoreLocation
import Alamofire

let apiKey = "AIzaSyAAKDvZ3gaUZkBFuEl_xA7X2v25MS4vxlc"
let googleURL = "https://maps.googleapis.com/maps/api/geocode/json?latlng=xxx,yyy&key="+apiKey
//replace xxx with lat and yyy with lon, eg 29.382177,47.989652.
class GoogleLocationApi: NSObject
{
    
    class func getSublocality(completion:@escaping (_ error:Error?,_ task:String)->Void)
    {
        let req = LocationManager.shared.locateFromGPS(.oneShot, accuracy: .city) { result in
            switch result {
            case .failure(let error):
                debugPrint("Received error: \(error)")
            case .success(let location):
                debugPrint("Location received: \(location)")
                var url = googleURL
                url = url.replacingOccurrences(of: "xxx", with: "\(location.coordinate.latitude)")
                url = url.replacingOccurrences(of: "yyy", with: "\(location.coordinate.longitude)")
                
                print("url : ", url)
                showLoader()
                var headers : HTTPHeaders = ["Accept-Language" : "ar"]
                if(isEnglishApp()){
                    headers = ["Accept-Language" : "en"]
                }
                print("location header : ", headers)
                AF.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers)
                    .responseJSON { (response) in
                        
                        dismissLoader()
                        
                        switch response.result{
                        case .success(let value):
                            let data = response.data
                            do{
                                let locationData = try JSONDecoder().decode(googleLocation.self, from: data!)
                                for eachResult in locationData.results!{
                                    for eachType in eachResult.types!{
                                        if (eachType == "sublocality"){//route
                                            for eachAddressComponent in eachResult.address_components!{
                                                for eachAddressComponentType in eachAddressComponent.types!{
                                                    if(eachAddressComponentType == "sublocality"){
                                                        completion(nil, eachAddressComponent.long_name ?? "area not found")
                                                        return
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                for eachResult in locationData.results!{
                                    for eachType in eachResult.types!{
                                        if (eachType == "locality"){
                                            for eachAddressComponent in eachResult.address_components!{
                                                for eachAddressComponentType in eachAddressComponent.types!{
                                                    if(eachAddressComponentType == "locality"){
                                                        completion(nil, eachAddressComponent.long_name ?? "area not found")
                                                        return
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                
                            }catch {
                                print("error : ", error)
                            }
                        case .failure(let error):
                            
                            if (error._code==NSURLErrorTimedOut) {
                                
                                UserDefaults.standard.set("-1001", forKey: "AppStatusCode")
                                UserDefaults.standard.synchronize()
                                
                                
                            } else {
                                
                                
                                print("\n\n===========Error===========")
                                print("Error Code: \(error._code)")
                                print("Error Messsage: \(error.localizedDescription)")
                                if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
                                    print("Server Error: " + str)
                                }
                                debugPrint(error as Any)
                                print("===========================\n\n")
                                
                                
                                
                            }
                        }
                }
            }
        }
    }
    
    
    class func getSublocalityWithStreet(completion:@escaping (_ error:Error?,_ task:[String:String])->Void)
    {
        let req = LocationManager.shared.locateFromGPS(.oneShot, accuracy: .city) { result in
            switch result {
            case .failure(let error):
                debugPrint("Received error: \(error)")
            case .success(let location):
                debugPrint("Location received: \(location)")
                var url = googleURL
                url = url.replacingOccurrences(of: "xxx", with: "\(location.coordinate.latitude)")
                url = url.replacingOccurrences(of: "yyy", with: "\(location.coordinate.longitude)")
                
                print("url : ", url)
                showLoader()
                var headers : HTTPHeaders = ["Accept-Language" : "ar"]
                if(isEnglishApp()){
                    headers = ["Accept-Language" : "en"]
                }
                print("location header : ", headers)
                AF.request(url, method: .post, parameters:  nil, encoding: JSONEncoding.default, headers: headers)
                    .responseJSON { (response) in
                        
                        dismissLoader()
                        
                        switch response.result{
                        case .success(let value):
                            let data = response.data
                            
                            var areaName = ""
                            var streetName = ""
                            
                            do{
                                let locationData = try JSONDecoder().decode(googleLocation.self, from: data!)
                                for eachResult in locationData.results!{
                                    for eachType in eachResult.types!{
                                        if (eachType == "route"){
                                            for eachAddressComponent in eachResult.address_components!{
                                                for eachAddressComponentType in eachAddressComponent.types!{
                                                    if(eachAddressComponentType == "route"){
                                                        streetName = eachAddressComponent.short_name ?? ""
                                                    }
                                                    //                                                    if(eachAddressComponentType == "locality"){
                                                    //                                                        if(areaName == ""){
                                                    //                                                            areaName = eachAddressComponent.long_name ?? ""
                                                    //                                                        }
                                                    //
                                                    //                                                    }else if(eachAddressComponentType == "sublocality"){
                                                    //                                                        areaName = eachAddressComponent.long_name ?? ""
                                                    //                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                for eachResult in locationData.results!{
                                    for eachType in eachResult.types!{
                                        if (eachType == "sublocality"){
                                            for eachAddressComponent in eachResult.address_components!{
                                                for eachAddressComponentType in eachAddressComponent.types!{
                                                    if(eachAddressComponentType == "sublocality"){
                                                        if(areaName == ""){
                                                            areaName = eachAddressComponent.long_name ?? ""
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                for eachResult in locationData.results!{
                                    for eachType in eachResult.types!{
                                        if (eachType == "locality"){
                                            for eachAddressComponent in eachResult.address_components!{
                                                for eachAddressComponentType in eachAddressComponent.types!{
                                                    if(eachAddressComponentType == "locality"){
                                                        if(areaName == ""){
                                                            areaName = eachAddressComponent.long_name ?? ""
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                let params = ["area":areaName,
                                              "street":streetName]
                                
                                completion(nil, params)
                            }catch {
                                print("error : ", error)
                            }
                        case .failure(let error):
                            
                            if (error._code==NSURLErrorTimedOut) {
                                
                                UserDefaults.standard.set("-1001", forKey: "AppStatusCode")
                                UserDefaults.standard.synchronize()
                                
                                
                            } else {
                                
                                
                                print("\n\n===========Error===========")
                                print("Error Code: \(error._code)")
                                print("Error Messsage: \(error.localizedDescription)")
                                if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
                                    print("Server Error: " + str)
                                }
                                debugPrint(error as Any)
                                print("===========================\n\n")
                                
                                
                                
                            }
                        }
                }
            }
        }
    }
    
    class func getSublocalityWithStreetForLocation(location:  CLLocation, completion:@escaping (_ error:Error?,_ task:[String:String])->Void)
    {
        
        var url = googleURL
        url = url.replacingOccurrences(of: "xxx", with: "\(location.coordinate.latitude)")
        url = url.replacingOccurrences(of: "yyy", with: "\(location.coordinate.longitude)")
        
        print("url : ", url)
        showLoader()
        var headers : HTTPHeaders = ["Accept-Language" : "ar"]
        if(isEnglishApp()){
            headers = ["Accept-Language" : "en"]
        }
        AF.request(url, method: .post, parameters:  nil, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { (response) in
                
                dismissLoader()
                
                switch response.result{
                case .success(let value):
                    let data = response.data
                    
                    var areaName = ""
                    var streetName = ""
                    
                    do{
                        let locationData = try JSONDecoder().decode(googleLocation.self, from: data!)
                        for eachResult in locationData.results!{
                            for eachType in eachResult.types!{
                                if (eachType == "route"){
                                    for eachAddressComponent in eachResult.address_components!{
                                        for eachAddressComponentType in eachAddressComponent.types!{
                                            if(eachAddressComponentType == "route"){
                                                streetName = eachAddressComponent.short_name ?? ""
                                            }
                                            //                                            if(eachAddressComponentType == "locality"){
                                            //                                                if(areaName == ""){
                                            //                                                    areaName = eachAddressComponent.long_name ?? ""
                                            //                                                }
                                            //
                                            //                                            }else if(eachAddressComponentType == "sublocality"){
                                            //                                                areaName = eachAddressComponent.long_name ?? ""
                                            //                                            }
                                        }
                                    }
                                }
                            }
                        }
                        for eachResult in locationData.results!{
                            for eachType in eachResult.types!{
                                if (eachType == "sublocality"){
                                    for eachAddressComponent in eachResult.address_components!{
                                        for eachAddressComponentType in eachAddressComponent.types!{
                                            if(eachAddressComponentType == "sublocality"){
                                                if(areaName == ""){
                                                    areaName = eachAddressComponent.long_name ?? ""
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        for eachResult in locationData.results!{
                            for eachType in eachResult.types!{
                                if (eachType == "locality"){
                                    for eachAddressComponent in eachResult.address_components!{
                                        for eachAddressComponentType in eachAddressComponent.types!{
                                            if(eachAddressComponentType == "locality"){
                                                if(areaName == ""){
                                                    areaName = eachAddressComponent.long_name ?? ""
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        let params = ["area":areaName,
                                      "street":streetName]
                        
                        completion(nil, params)
                        
                    }catch {
                        print("error : ", error)
                    }
                case .failure(let error):
                    
                    if (error._code==NSURLErrorTimedOut) {
                        
                        UserDefaults.standard.set("-1001", forKey: "AppStatusCode")
                        UserDefaults.standard.synchronize()
                        
                        
                    } else {
                        
                        
                        print("\n\n===========Error===========")
                        print("Error Code: \(error._code)")
                        print("Error Messsage: \(error.localizedDescription)")
                        if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
                            print("Server Error: " + str)
                        }
                        debugPrint(error as Any)
                        print("===========================\n\n")
                        
                        
                        
                    }
                }
        }
    }
    
    class func getLocality(completion:@escaping (_ error:Error?,_ task:String)->Void)
    {
        let req = LocationManager.shared.locateFromGPS(.oneShot, accuracy: .city) { result in
            switch result {
            case .failure(let error):
                debugPrint("Received error: \(error)")
            case .success(let location):
                debugPrint("Location received: \(location)")
                var url = googleURL
                url = url.replacingOccurrences(of: "xxx", with: "\(location.coordinate.latitude)")
                url = url.replacingOccurrences(of: "yyy", with: "\(location.coordinate.longitude)")
                
                print("url : ", url)
                showLoader()
                var headers : HTTPHeaders = ["Accept-Language" : "ar"]
                if(isEnglishApp()){
                    headers = ["Accept-Language" : "en"]
                }
                print("location header : ", headers)
                AF.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers)
                    .responseJSON { (response) in
                        
                        dismissLoader()
                        
                        switch response.result{
                        case .success(let value):
                            let data = response.data
                            do{
                                let locationData = try JSONDecoder().decode(googleLocation.self, from: data!)
                                
                                
                                for eachResult in locationData.results!{
                                    for eachType in eachResult.types!{
                                        if (eachType == "locality"){
                                            for eachAddressComponent in eachResult.address_components!{
                                                for eachAddressComponentType in eachAddressComponent.types!{
                                                    if(eachAddressComponentType == "locality"){
                                                        completion(nil, eachAddressComponent.long_name ?? "area not found")
                                                        return
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                
                            }catch {
                                print("error : ", error)
                            }
                        case .failure(let error):
                            
                            if (error._code==NSURLErrorTimedOut) {
                                
                                UserDefaults.standard.set("-1001", forKey: "AppStatusCode")
                                UserDefaults.standard.synchronize()
                                
                                
                            } else {
                                
                                
                                print("\n\n===========Error===========")
                                print("Error Code: \(error._code)")
                                print("Error Messsage: \(error.localizedDescription)")
                                if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
                                    print("Server Error: " + str)
                                }
                                debugPrint(error as Any)
                                print("===========================\n\n")
                                
                                
                                
                            }
                        }
                }
            }
        }
    }
    
    class func getLocalityWithStreet(completion:@escaping (_ error:Error?,_ task:[String:String])->Void)
    {
        let req = LocationManager.shared.locateFromGPS(.oneShot, accuracy: .city) { result in
            switch result {
            case .failure(let error):
                debugPrint("Received error: \(error)")
            case .success(let location):
                debugPrint("Location received: \(location)")
                var url = googleURL
                url = url.replacingOccurrences(of: "xxx", with: "\(location.coordinate.latitude)")
                url = url.replacingOccurrences(of: "yyy", with: "\(location.coordinate.longitude)")
                
                print("url : ", url)
                showLoader()
                var headers : HTTPHeaders = ["Accept-Language" : "ar"]
                if(isEnglishApp()){
                    headers = ["Accept-Language" : "en"]
                }
                print("location header : ", headers)
                AF.request(url, method: .post, parameters:  nil, encoding: JSONEncoding.default, headers: headers)
                    .responseJSON { (response) in
                        
                        dismissLoader()
                        
                        switch response.result{
                        case .success(let value):
                            let data = response.data
                            
                            var areaName = ""
                            var streetName = ""
                            
                            do{
                                let locationData = try JSONDecoder().decode(googleLocation.self, from: data!)
                                for eachResult in locationData.results!{
                                    for eachType in eachResult.types!{
                                        if (eachType == "route"){
                                            for eachAddressComponent in eachResult.address_components!{
                                                for eachAddressComponentType in eachAddressComponent.types!{
                                                    if(eachAddressComponentType == "route"){
                                                        streetName = eachAddressComponent.short_name ?? ""
                                                    }
                                                    
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                
                                for eachResult in locationData.results!{
                                    for eachType in eachResult.types!{
                                        if (eachType == "locality"){
                                            for eachAddressComponent in eachResult.address_components!{
                                                for eachAddressComponentType in eachAddressComponent.types!{
                                                    if(eachAddressComponentType == "locality"){
                                                        if(areaName == ""){
                                                            areaName = eachAddressComponent.long_name ?? ""
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                let params = ["area":areaName,
                                              "street":streetName]
                                
                                completion(nil, params)
                            }catch {
                                print("error : ", error)
                            }
                        case .failure(let error):
                            
                            if (error._code==NSURLErrorTimedOut) {
                                
                                UserDefaults.standard.set("-1001", forKey: "AppStatusCode")
                                UserDefaults.standard.synchronize()
                                
                                
                            } else {
                                
                                
                                print("\n\n===========Error===========")
                                print("Error Code: \(error._code)")
                                print("Error Messsage: \(error.localizedDescription)")
                                if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
                                    print("Server Error: " + str)
                                }
                                debugPrint(error as Any)
                                print("===========================\n\n")
                                
                                
                                
                            }
                        }
                }
            }
        }
    }
    
    class func getLocalityWithStreetForLocation(location:  CLLocation, completion:@escaping (_ error:Error?,_ task:[String:String])->Void)
    {
        
        var url = googleURL
        url = url.replacingOccurrences(of: "xxx", with: "\(location.coordinate.latitude)")
        url = url.replacingOccurrences(of: "yyy", with: "\(location.coordinate.longitude)")
        
        print("url : ", url)
        showLoader()
        var headers : HTTPHeaders = ["Accept-Language" : "ar"]
        if(isEnglishApp()){
            headers = ["Accept-Language" : "en"]
        }
        AF.request(url, method: .post, parameters:  nil, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { (response) in
                
                dismissLoader()
                
                switch response.result{
                case .success(let value):
                    let data = response.data
                    
                    var areaName = ""
                    var streetName = ""
                    
                    do{
                        let locationData = try JSONDecoder().decode(googleLocation.self, from: data!)
                        for eachResult in locationData.results!{
                            for eachType in eachResult.types!{
                                if (eachType == "route"){
                                    for eachAddressComponent in eachResult.address_components!{
                                        for eachAddressComponentType in eachAddressComponent.types!{
                                            if(eachAddressComponentType == "route"){
                                                streetName = eachAddressComponent.short_name ?? ""
                                            }
                                            
                                        }
                                    }
                                }
                            }
                        }
                        
                        for eachResult in locationData.results!{
                            for eachType in eachResult.types!{
                                if (eachType == "locality"){
                                    for eachAddressComponent in eachResult.address_components!{
                                        for eachAddressComponentType in eachAddressComponent.types!{
                                            if(eachAddressComponentType == "locality"){
                                                if(areaName == ""){
                                                    areaName = eachAddressComponent.long_name ?? ""
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        let params = ["area":areaName,
                                      "street":streetName]
                        
                        completion(nil, params)
                        
                    }catch {
                        print("error : ", error)
                    }
                case .failure(let error):
                    
                    if (error._code==NSURLErrorTimedOut) {
                        
                        UserDefaults.standard.set("-1001", forKey: "AppStatusCode")
                        UserDefaults.standard.synchronize()
                        
                        
                    } else {
                        
                        
                        print("\n\n===========Error===========")
                        print("Error Code: \(error._code)")
                        print("Error Messsage: \(error.localizedDescription)")
                        if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
                            print("Server Error: " + str)
                        }
                        debugPrint(error as Any)
                        print("===========================\n\n")
                        
                        
                        
                    }
                }
        }
    }
    
    
    class func getAreaCityForLocation(location:  CLLocation, completion:@escaping (_ error:Error?,_ task:[String:String])->Void)
    {
        var url = googleURL
        url = url.replacingOccurrences(of: "xxx", with: "\(location.coordinate.latitude)")
        url = url.replacingOccurrences(of: "yyy", with: "\(location.coordinate.longitude)")
        print("url : ", url)
        var headers : HTTPHeaders = ["Accept-Language" : "ar"]
        if(isEnglishApp()){
            headers = ["Accept-Language" : "en"]
        }
        AF.request(url, method: .post, parameters:  nil, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { (response) in
                
                
                switch response.result{
                case .success(let value):
                    let data = response.data
                    
                    var areaName = ""
                    var streetName = ""
                    
                    do{
                        let locationData = try JSONDecoder().decode(googleLocation.self, from: data!)
                        for eachResult in locationData.results!{
                            
                            for eachAddressComponent in eachResult.address_components!{
                                for eachAddressComponentType in eachAddressComponent.types!{
                                    if(eachAddressComponentType == "administrative_area_level_1"){
                                        streetName = eachAddressComponent.long_name ?? ""
                                    }
                                }
                            }
                            
                        }
                        for eachResult in locationData.results!{
                            for eachType in eachResult.types!{
                                if (eachType == "sublocality"){
                                    for eachAddressComponent in eachResult.address_components!{
                                        for eachAddressComponentType in eachAddressComponent.types!{
                                            if(eachAddressComponentType == "sublocality"){
                                                if(areaName == ""){
                                                    areaName = eachAddressComponent.long_name ?? ""
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        for eachResult in locationData.results!{
                            for eachType in eachResult.types!{
                                if (eachType == "locality"){
                                    for eachAddressComponent in eachResult.address_components!{
                                        for eachAddressComponentType in eachAddressComponent.types!{
                                            if(eachAddressComponentType == "locality"){
                                                if(areaName == ""){
                                                    areaName = eachAddressComponent.long_name ?? ""
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        let params = ["Area":areaName,
                                      "City":streetName]
                        
                        completion(nil, params)
                        
                    }catch {
                        print("\n\n===========Error===========")
                        print("error : ", error)
                    }
                case .failure(let error):
                    
                    if (error._code==NSURLErrorTimedOut) {
                        
                        UserDefaults.standard.set("-1001", forKey: "AppStatusCode")
                        UserDefaults.standard.synchronize()
                        
                        
                    } else {
                        
                        
                        print("\n\n===========Error===========")
                        print("Error Code: \(error._code)")
                        print("Error Messsage: \(error.localizedDescription)")
                        if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
                            print("Server Error: " + str)
                        }
                        debugPrint(error as Any)
                        print("===========================\n\n")
                        
                        
                        
                    }
                }
        }
    }
}
