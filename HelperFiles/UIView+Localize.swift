//
//  UIView+Localize.swift
//  T3ALm
//
//  Created by Mohammed Yusuf Mitha on 02/11/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func flipView(withCorrection: CGFloat? = 0){
        
        let oldX = self.frame.origin.x
        let width = self.frame.width
        
        var newX = screenWidth - oldX - width
        newX = newX - (withCorrection ?? 0.0)
        self.frame.origin.x = newX
        
        if let label = self as? UILabel{
            switch label.textAlignment {
            case .left:
                label.textAlignment = .right
            case .right:
                label.textAlignment = .left
            default:
                label.textAlignment = .center
            }
        }
        if let button = self as? UIButton{
            button.setBackgroundImage(button.backgroundImage(for: .normal)?.withHorizontallyFlippedOrientation(), for: .normal)
            button.setImage(button.image(for: .normal)?.withHorizontallyFlippedOrientation(), for: .normal)
            switch button.contentHorizontalAlignment {
            case .left:
                button.contentHorizontalAlignment = .right
            case .right:
                button.contentHorizontalAlignment = .left
            default:
                button.contentHorizontalAlignment = .center
            }
        }
        if let textField = self as? UITextField{
            switch textField.textAlignment {
            case .left:
                textField.textAlignment = .right
            case .right:
                textField.textAlignment = .left
            default:
                textField.textAlignment = .center
            }
        }
        
        if let imageView = self as? UIImageView{
            imageView.image = imageView.image?.withHorizontallyFlippedOrientation()
        }
        
        
    }
    
    func enableDebug(color: UIColor, borderWidth : CGFloat = 2){
        self.borderWidth = borderWidth
        self.borderColor = color
    }
}
