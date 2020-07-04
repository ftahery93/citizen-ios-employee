//
//  sharedPref.swift
//  T3ALm
//
//  Created by Mohammed Yusuf Mitha on 04/12/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation
 
import UIKit

class sharedPref {
    
    static let shared = sharedPref()
    
    private let pref = UserDefaults.standard
    
    
    /// store value in user defaults
    ///
    /// - Parameters:
    ///   - value: you can store any value that can be converted to JsonObject
    ///   - key: the specified key for this value
    func setSharedValue(_ key:String, value:Any)
    {
        self.pref.set(value, forKey: key)
    }
    
    
    /// get stored value for a specific key
    ///
    /// - Parameter key: the value key
    /// - Returns: the value if exist as (Any?) or nil if it doesn't exist
    func getSharedValue(forKey key:String) -> Any?
    {
        return self.pref.object(forKey: key)
    }

    
    /// get stored string for a specific key
    ///
    /// - Parameter key: the string key
    /// - Returns: the string value if exist or empty string if it doesn't exist
    func getSharedSrting(forKey key:String) -> String {
        return self.pref.object(forKey: key) as? String ?? ""
    }
    
    
    /// get stored string for a specific key
    ///
    /// - Parameter key: the int key
    /// - Returns: the int value if exist or 0 if it doesn't exist
    func getSharedInt(forKey key:String) -> Int {
        return self.pref.object(forKey: key) as? Int ?? 0
    }
    
    /// get stored Bool for a specific key
    ///
    /// - Parameter key: the Bool key
    /// - Returns: the Bool value if exist or false if it doesn't exist
    func getSharedBool(forKey key:String) -> Bool {
        return self.pref.object(forKey: key) as? Bool ?? false
    }
    
    func removeValue(forKey key:String) {
        self.pref.removeObject(forKey: key)
    }
    
    
    /// cleare all stored data
    func clearCach() {
        let domain = Bundle.main.bundleIdentifier ?? ""
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
}
