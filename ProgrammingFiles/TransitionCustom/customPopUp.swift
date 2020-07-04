
//
//  File.swift
//  customTransmission
//
//  Created by Mohammed Yusuf Mitha on 16/02/20.
//  Copyright © 2020 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class customPopUp: NSObject, UIViewControllerAnimatedTransitioning {
    
    var popStyle: Bool = false
    var startingPoint : CGPoint = .zero
    var duration = globalAnimationDuration
 
    func transitionDuration(
        using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        if popStyle {
            let fz = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
            let tz = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
            let sv : UIImageView = UIImageView()

            
            transitionContext.containerView.insertSubview(tz.view, belowSubview: fz.view)
            
            if(globalImageurl != ""){
                
                sv.frame =  globalDestImageFrame
                sv.contentMode = .scaleAspectFill
                sv.clipsToBounds = true
                let url =  URL(string: globalImageurl ?? " ")
                sv.kf.indicatorType = .activity
                sv.kf.setImage(
                    with: url,
                    placeholder: UIImage(named: " "),
                    options: [
                        .cacheOriginalImage
                ])
                
                transitionContext.containerView.addSubview(sv)
            }
            
            
            
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: .curveEaseOut, animations: {
                
                if(globalImageurl == ""){
                    
                    fz.view.transform = CGAffineTransform.init(translationX: 0, y: UIScreen.main.bounds.height)
                }else {
                    
                    sv.frame = globalImageFrame
                    fz.view.alpha = 0.0
                }
                
                
                
            }, completion: {_ in
                globalImageurl = ""
                globalImageFrame = .zero
                globalDestImageFrame = .zero
                sv.removeFromSuperview()
                transitionContext.completeTransition(true)
            })
            
        } else{
            
            if let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to){
                let viewCenter = presentedView.center
                let sv : UIImageView = UIImageView()
                
                if(globalImageurl != ""){
                    
                    presentedView.transform = CGAffineTransform.identity
                    presentedView.alpha = 0.0
                    containerView.addSubview(presentedView)
                    sv.frame =  globalImageFrame
                    sv.contentMode = .scaleAspectFill
                    sv.clipsToBounds = true
                    let url =  URL(string: globalImageurl )
                    sv.kf.indicatorType = .activity
                    sv.kf.setImage(
                        with: url,
                        placeholder: UIImage(named: ""),
                    options: [
                        .cacheOriginalImage
                    ])
                
                
                
                containerView.addSubview(sv)
                } else {
                    presentedView.transform = CGAffineTransform.init(translationX: 0, y: screenHeight)
                    presentedView.alpha = 0.0
                    containerView.addSubview(presentedView)
                }
                
                UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: .curveEaseOut, animations: {
                    
                    sv.frame = globalDestImageFrame
                    presentedView.transform = CGAffineTransform.identity
                    presentedView.alpha = 1.0
                    presentedView.center = viewCenter
                    
                }) { (success :Bool) in
                    globalImageurl = ""
                    sv.removeFromSuperview()
                    transitionContext.completeTransition(success)
                }
            }
        }
    }
}
