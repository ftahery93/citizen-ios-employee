//
//  HomeCV.swift
//  NetLet
//
//  Created by Mohammed Yusuf Mitha on 03/07/20.
//  Copyright © 2020 Mohammed Yusuf Mitha. All rights reserved.
//

import UIKit
import Stevia

class HomeCV: UITableViewCell {
    
    var itemImageView = UIImageView()
    var issueNumberLabel = UILabel()
    var issueDescription = UILabel()
    var resolvedLabel = UILabel()
    var line = UIView()
    var cellData : Issue?
    
    func setUpView(_ data : Issue?){
        cellData = data
        self.backgroundColor = myBackgroundColor
        var myViews = [itemImageView,
                       issueNumberLabel,
                       issueDescription,
                       resolvedLabel,
                       line]
        
        for each in myViews{
            self.contentView.addSubview(each)
            each.translatesAutoresizingMaskIntoConstraints = false
         }
        
        itemImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10*iPhoneFactorX).isActive = true
        itemImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10*iPhoneFactorX).isActive = true
        itemImageView.heightAnchor.constraint(equalToConstant: 75*iPhoneFactorX).isActive = true
        itemImageView.widthAnchor.constraint(equalToConstant: 75*iPhoneFactorX).isActive = true
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.clipsToBounds = true
        itemImageView.image = UIImage(named: "products_package_noimg")
        
        issueNumberLabel.topAnchor.constraint(equalTo: itemImageView.topAnchor).isActive = true
        issueNumberLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 10*iPhoneFactorX).isActive = true
        issueNumberLabel.adjustDefaultLabel(fontColor: "#000000", fontSize: 15, fontType: "2")
        issueNumberLabel.text = "Issue #12"
        
        
        issueDescription.topAnchor.constraint(equalTo: issueNumberLabel.bottomAnchor, constant: 10*iPhoneFactorX).isActive = true
        issueDescription.leadingAnchor.constraint(equalTo: issueNumberLabel.leadingAnchor).isActive = true
        issueDescription.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10*iPhoneFactorX).isActive = true

        issueDescription.adjustDefaultLabel(fontColor: "#000000", fontSize: 13, fontType: "1")
        issueDescription.text = "hello how are you? the hello how are you hello how are you? the hello how are you hello how are you? the hello how are you"
        issueDescription.numberOfLines = 3
        issueDescription.lineBreakMode = .byTruncatingTail
        resolvedLabel.topAnchor.constraint(equalTo: issueDescription.bottomAnchor, constant: 15*iPhoneFactorX).isActive = true
        resolvedLabel.trailingAnchor.constraint(equalTo: issueDescription.trailingAnchor).isActive = true
        resolvedLabel.adjustDefaultLabel(fontColor: "#555555", fontSize: 13, fontType: "1")
        resolvedLabel.text = ""
        resolvedLabel.numberOfLines = 1
        
        
        
        if let resolved = cellData?.approved_date{
            resolvedLabel.text = resolved
            
            line.topAnchor.constraint(equalTo: resolvedLabel.bottomAnchor, constant: 5*iPhoneFactorX).isActive = true
            line.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
            line.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
            line.heightAnchor.constraint(equalToConstant: 1*iPhoneFactorX).isActive = true
            line.backgroundColor = .lightGray
            
            self.contentView.bottomAnchor.constraint(equalTo: resolvedLabel.bottomAnchor, constant: 11*iPhoneFactorX).isActive = true

        }else{
            
            line.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 10*iPhoneFactorX).isActive = true
            line.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
            line.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
            line.heightAnchor.constraint(equalToConstant: 1*iPhoneFactorX).isActive = true
            line.backgroundColor = .lightGray
            
            self.contentView.bottomAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 11*iPhoneFactorX).isActive = true

        }
        
        
          updateFields()
            
         
    }
    func updateFields(){
        if let image = cellData?.image{
            let url =  URL(string: image)
            itemImageView.kf.indicatorType = .activity
            itemImageView.kf.setImage(
                with: url,
                placeholder: UIImage(named: "placeholderImage"),
                options: [
                    .transition(.fade(0.3)),
                    .cacheOriginalImage
                ])
            {
                result in
                switch result {
                    case .success(let value):
                        break
                    //   print("Task done for: \(value.source.url?.absoluteString ?? "")")
                    case .failure(let error):
                        print("Job failed: \(error.localizedDescription)")
                }
            }
            
        }
        
        if let id = cellData?.id{
            issueNumberLabel.text = "Issue #\(id)"
        }
        if let description = cellData?.description{
            issueDescription.text = description
        }
       
    }
}
