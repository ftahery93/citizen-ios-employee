//
//  stepper.swift
//  PlaygroundTest
//
//  Created by Mohammed Yusuf Mitha on 26/01/20.
//  Copyright © 2020 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation

import UIKit

class myStepper: UIView {
    
 
    var plusButton    = UIButton()
    var minusButton   = UIButton()
    var stepperLabel  = UILabel()
    
    var currentCount : Int = 1
    var myView :[UIView] = []
    var delegate : stepperDelegates?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setUpView(){
        
        let myViews = [plusButton,
                       minusButton,
                       stepperLabel]
        
        for each in myViews{
            self.addSubview(each)
            each.translatesAutoresizingMaskIntoConstraints = false
        }
        
        minusButton.setBackgroundImage(UIImage(named: "minus_stepper.png"), for: .normal)
        minusButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        minusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: 15*iPhoneFactorX).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 15*iPhoneFactorX).isActive = true

        
        stepperLabel.adjustDefaultLabel(fontColor: "#343339", fontSize: 11, fontType: "1")
        stepperLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        stepperLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        stepperLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 0).isActive = true
        stepperLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: 0).isActive = true
        stepperLabel.textAlignment = .center
        stepperLabel.text = "\(currentCount)"

        plusButton.setBackgroundImage(UIImage(named: "plus_stepper.png"), for: .normal)
        plusButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        plusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 15*iPhoneFactorX).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 15*iPhoneFactorX).isActive = true

        
        self.topAnchor.constraint(equalTo: minusButton.topAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: minusButton.bottomAnchor, constant: 0).isActive = true
        self.leadingAnchor.constraint(equalTo: minusButton.leadingAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: plusButton.trailingAnchor, constant: 0).isActive = true
        
        
        
        plusButton.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        
        
        
        
        
         
    }
    
    @objc func minusButtonPressed(){
        print("minus")
        
        if (currentCount == 1)
        {
            //do not decrement.
        }
        else{
            currentCount = currentCount - 1
            stepperLabel.text = "\(currentCount)"
            delegate?.stepperDidChangeValue(newValue: currentCount)

        }
        
    }
    @objc func plusButtonPressed(){
        print("plus")
        currentCount = currentCount + 1
        stepperLabel.text = "\(currentCount)"
        
        delegate?.stepperDidChangeValue(newValue: currentCount)

    }
    
    func setCurrentCount(Count : Int){
        
        currentCount = Count
        stepperLabel.text = "\(currentCount)"
        
    }
    
}
protocol stepperDelegates{
    func stepperDidChangeValue(newValue:Int)
}
