//
//  File.swift
//  NetLet
//
//  Created by Mohammed Yusuf Mitha on 02/03/20.
//  Copyright © 2020 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation
import UIKit

class s4TabBarVC: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.selectedIndex = UserDefaults.standard.value(forKey: "selectedIndex") as! Int
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.selectedIndex = UserDefaults.standard.value(forKey: "selectedIndex") as! Int
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
   
}

