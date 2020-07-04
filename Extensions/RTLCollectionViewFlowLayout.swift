//
//  File.swift
//  NetLet
//
//  Created by Mohammed Yusuf Mitha on 08/03/20.
//  Copyright © 2020 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation
import UIKit

class RTLCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
 
    override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return true
    }
    
//    override var developmentLayoutDirection: UIUserInterfaceLayoutDirection {
//        if(isEnglishApp() == true){
//            return UIUserInterfaceLayoutDirection.leftToRight
//        } else {
//            return UIUserInterfaceLayoutDirection.rightToLeft
//        }
//     }
}
