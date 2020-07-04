//
//  ReportVC.swift
//  NetLet
//
//  Created by Mohammed Yusuf Mitha on 03/07/20.
//  Copyright © 2020 Mohammed Yusuf Mitha. All rights reserved.
//

import UIKit
import YPImagePicker
import Lightbox
import Alamofire
import SwiftLocation
import CoreLocation
import Alamofire


class ReportVC: Base {
    var scroll = UIScrollView()
    var imagesArray : YPMediaItem?
    var addImageButton = UIButton()
    var descriptionTV = UITextView()
    var personalInformationLabel = UILabel()
    var nameTV = UITextView()
    var phoneTV = UITextView()
    var reportIssueButton = UIButton()
    var selectedImage : UIImage?
    var resolvedButton = UIButton()
    var lat = ""
    var long = ""
    var locationLabel = UILabel()

    var comingForDetails = false
    var issueObject : Issue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = myBackgroundColor
        setUpView()
        
        getLocation()
        
        if (comingForDetails == true){

            addImageButton.kf.setBackgroundImage(with: URL(string: issueObject?.image ?? ""), for: .normal)
            descriptionTV.text = issueObject?.description ?? ""
            phoneTV.text = issueObject?.mobile ?? ""
            nameTV.text = issueObject?.fullname ?? ""
            resolvedButton.kf.setBackgroundImage(with: URL(string: issueObject?.approved_image ?? ""), for: .normal)

            descriptionTV.isEditable = false
            phoneTV.isEditable = false
            nameTV.isEditable = false
            addImageButton.isUserInteractionEnabled = false
            resolvedButton.isUserInteractionEnabled = false
            
            //MARK:- addImageButton
                self.scroll.addSubview(resolvedButton)
                resolvedButton.translatesAutoresizingMaskIntoConstraints = false
                resolvedButton.adjustDefaultButton(fontColor: "#8E8E8E", fontSize: 12, fontType: "1")
                resolvedButton.topAnchor.constraint(equalTo: phoneTV.bottomAnchor, constant: 25*iPhoneFactorX).isActive = true
                resolvedButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
                resolvedButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
                resolvedButton.backgroundColor = .clear
            if(issueObject?.approved_image != nil){
                resolvedButton.heightAnchor.constraint(equalToConstant: screenWidth).isActive = true
            }else {
                resolvedButton.heightAnchor.constraint(equalToConstant: 0).isActive = true
            }
        }
    }
    
    func getLocation(){
        let req = LocationManager.shared.locateFromGPS(.oneShot, accuracy: .city) { result in
            switch result {
                case .failure(let error):
                    debugPrint("Received error: \(error)")
                
                case .success(let location):
                    debugPrint("Location received: \(location)")
                    self.lat =  "\(location.coordinate.latitude)"
                    self.long = "\(location.coordinate.longitude)"
                    break
                
                default : break
            }
        }
    }
    
    func setUpView(){
        topBar.title.text = "Report an issue"
        self.view.addSubview(scroll)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.fillHorizontally()
        scroll.topAnchor.constraint(equalTo: topBar.bottomAnchor, constant: 0).isActive = true
        scroll.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        scroll.showsVerticalScrollIndicator = false
        
        self.scroll.addSubview(addImageButton)
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        self.scroll.addSubview(descriptionTV)
        descriptionTV.translatesAutoresizingMaskIntoConstraints = false
        self.scroll.addSubview(nameTV)
        nameTV.translatesAutoresizingMaskIntoConstraints = false
        self.scroll.addSubview(phoneTV)
        phoneTV.translatesAutoresizingMaskIntoConstraints = false
        self.scroll.addSubview(personalInformationLabel)
        personalInformationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.scroll.addSubview(reportIssueButton)
        reportIssueButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        //MARK:- addImageButton
        addImageButton.adjustDefaultButton(fontColor: "#8E8E8E", fontSize: 12, fontType: "1")
        addImageButton.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
        addImageButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        addImageButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        addImageButton.heightAnchor.constraint(equalToConstant: screenWidth).isActive = true
        addImageButton.backgroundColor = .clear
        addImageButton.addTarget(self, action: #selector(addImageButtonAction), for: .touchUpInside)
        addImageButton.setBackgroundImage(UIImage(named: "add_image.png"), for: .normal)
        
        
        //MARK:- locationLabel
        locationLabel.adjustDefaultLabel(fontColor: "#000000", fontSize: 15, fontType: "1")
        locationLabel.topAnchor.constraint(equalTo: addImageButton.bottomAnchor, constant: 10*iPhoneFactorX).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: addImageButton.leadingAnchor, constant: 20*iPhoneFactorX).isActive = true
        locationLabel.trailingAnchor.constraint(equalTo: addImageButton.trailingAnchor, constant: -20*iPhoneFactorX).isActive = true
        locationLabel.backgroundColor = .clear

        let tt = CLLocation(latitude: CLLocationDegrees(exactly: Double(issueObject!.latitude!)!)!,
                            longitude:CLLocationDegrees(exactly: Double(issueObject!.longitude!)!)!)
        GoogleLocationApi.getAreaCityForLocation(location: tt) { (error, task) in
            
            
            self.locationLabel.text = task["Area"]! + ", " + task["City"]! + "\n"
            self.locationLabel.text! += "Latitude : \(self.issueObject?.latitude! ?? "")" + "\nLongitude : \(self.issueObject?.longitude! ?? "")"
            
            self.view.layoutIfNeeded()
            
            }
        
        //MARK:- descriptionTV
        descriptionTV.adjustDefaultTextView(fontColor: "#000000", fontSize: 13, fontType: "1")
        descriptionTV.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10*iPhoneFactorX).isActive = true
        descriptionTV.leadingAnchor.constraint(equalTo: addImageButton.leadingAnchor, constant: 20*iPhoneFactorX).isActive = true
        descriptionTV.trailingAnchor.constraint(equalTo: addImageButton.trailingAnchor, constant: -20*iPhoneFactorX).isActive = true
        descriptionTV.heightAnchor.constraint(equalToConstant: screenWidth/2).isActive = true
        descriptionTV.backgroundColor = UIColor(hexString: "#e5e5e5")
        descriptionTV.placeholder = "Description*"
        
        
        
        //MARK:- personalInformationLabel
        personalInformationLabel.adjustDefaultLabel(fontColor: "#000000", fontSize: 15, fontType: "2")
        personalInformationLabel.topAnchor.constraint(equalTo: descriptionTV.bottomAnchor, constant: 10*iPhoneFactorX).isActive = true
        personalInformationLabel.leadingAnchor.constraint(equalTo: descriptionTV.leadingAnchor, constant: 0*iPhoneFactorX).isActive = true
        personalInformationLabel.text = "Personal Information (Optional)"
        
        
        
        //MARK:- descriptionTV
        nameTV.adjustDefaultTextView(fontColor: "#000000", fontSize: 13, fontType: "1")
        nameTV.topAnchor.constraint(equalTo: personalInformationLabel.bottomAnchor, constant: 10*iPhoneFactorX).isActive = true
        nameTV.leadingAnchor.constraint(equalTo: addImageButton.leadingAnchor, constant: 20*iPhoneFactorX).isActive = true
        nameTV.trailingAnchor.constraint(equalTo: addImageButton.trailingAnchor, constant: -20*iPhoneFactorX).isActive = true
        nameTV.heightAnchor.constraint(equalToConstant: 40*iPhoneFactorX).isActive = true
        nameTV.backgroundColor = UIColor(hexString: "#e5e5e5")
        nameTV.placeholder = "Name"
        
        
        //MARK:- phoneTV
        phoneTV.adjustDefaultTextView(fontColor: "#000000", fontSize: 13, fontType: "1")
        phoneTV.topAnchor.constraint(equalTo: nameTV.bottomAnchor, constant: 10*iPhoneFactorX).isActive = true
        phoneTV.leadingAnchor.constraint(equalTo: addImageButton.leadingAnchor, constant: 20*iPhoneFactorX).isActive = true
        phoneTV.trailingAnchor.constraint(equalTo: addImageButton.trailingAnchor, constant: -20*iPhoneFactorX).isActive = true
        phoneTV.heightAnchor.constraint(equalToConstant:  40*iPhoneFactorX).isActive = true
        phoneTV.backgroundColor = UIColor(hexString: "#e5e5e5")
        phoneTV.placeholder = "Phone Number"
        phoneTV.keyboardType = .asciiCapableNumberPad

        
        //MARK:- reportIssueButton
        reportIssueButton.adjustDefaultButton(fontColor: "#FFFFFF", fontSize: 15, fontType: "2")
        
        reportIssueButton.topAnchor.constraint(equalTo: phoneTV.bottomAnchor, constant: 25*iPhoneFactorX).isActive = true
        reportIssueButton.centerXAnchor.constraint(equalTo: topBar.centerXAnchor).isActive = true
        reportIssueButton.heightAnchor.constraint(equalToConstant:  40*iPhoneFactorX).isActive = true
        reportIssueButton.widthAnchor.constraint(equalToConstant:  240*iPhoneFactorX).isActive = true
        reportIssueButton.backgroundColor = myOrangeColor
        reportIssueButton.setTitle("Resolve Issue", for: .normal)
        reportIssueButton.layer.cornerRadius = 5
        reportIssueButton.addTarget(self, action: #selector(reportIssueButtonAction), for: .touchUpInside)
        
    }
    @objc func reportIssueButtonAction(){
        
       
        let dest = ResolveVC()
        dest.issueObject = self.issueObject
        self.navigationController?.pushViewController(dest, animated: true)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var t : UIView!
       
            t = reportIssueButton
         
        scroll.contentSize.height = t.frame.origin.y + t.frame.height + 10*iPhoneFactorX
        
        
    }
    @objc func addImageButtonAction(){
        var config = YPImagePickerConfiguration()
        config.screens = [.library, .photo]
        config.library.preselectedItems = imagesArray != nil ? [imagesArray!] : []
        config.library.maxNumberOfItems = 1
        config.showsPhotoFilters = false
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, _ in
            self.imagesArray = nil
            for item in items {
                switch item {
                    case .photo(let photo):
                        //add data to array here and update the stackview or whatever u are using to show it.
                        self.imagesArray = item

                    case .video(let video):
                        break
                    
                }
            }
            picker.dismiss(animated: true) {
                self.updateImageStack()
            }
        }
        present(picker, animated: true, completion: nil)
    }
    
    func convertImageToBase64String (img: UIImage) -> String {
        let imageData:NSData = img.jpegData(compressionQuality: 0.50)! as NSData //UIImagePNGRepresentation(img)
        let imgString = imageData.base64EncodedString(options: .init(rawValue: 0))
        return imgString
    }
    func updateImageStack(){
             switch imagesArray{
                case .photo(let photo):
                    addImageButton.setBackgroundImage(photo.image, for: .normal)
                    self.selectedImage = photo.image
                    break
                case .video(let v):
                    break
                
                default: break
            }
    }
    
    func connectToUploadObject(images: [String:[UIImage]] = [:], withParameters parm:[String:String]? = nil , toApi api:String,completion:@escaping (_ error:Error?,_ task:Any?)->Void)
    {
        
        
        print("api === \(api)")
        let headers : HTTPHeaders = [
            "Authorization": token
        ]
        
        AF.upload(multipartFormData: { multipart in
            //loop all parameters to convert it to data and append it to the request
            for (_key,_value) in parm ?? [:] {
                multipart.append(_value.data(using: .utf8) ?? Data(), withName: _key)
            }
            
            for (_key,_imgs) in images {
                for img in _imgs {
                    let data = img.jpegData(compressionQuality: 1) ?? Data()
                    multipart.append(data, withName: _key, fileName: "image.jpeg", mimeType: "image/jpeg")
                    print("mrmr", _key, img)
                }
            }
        }, to: api,  method: .post, headers: headers)
            .uploadProgress(queue: .main, closure: { (Progress) in
                print("Upload Progress: \(Progress.fractionCompleted)")
            }).response { (response) in
                print(response)

                if (response.response == nil) {
                    UserDefaults.standard.set("-1001", forKey: "AppStatusCode")
                    UserDefaults.standard.synchronize()
                    
                    if let jsonErr = response.error {
                        completion(jsonErr, nil)
                    }
                    
                } else {
                    
                    
                    print("response.result===\(response.result)")
                    switch response.result
                    {
                        case .failure(let error):
                            print("\n\n\n===========Error===========")
                            
                            
                            if (error._code==NSURLErrorTimedOut) {
                                print("----Timed Out Error ----")
                                
                                UserDefaults.standard.set("-1001", forKey: "AppStatusCode")
                                UserDefaults.standard.synchronize()
                                completion(error, nil)
                                
                            } else {
                                
                                print("Error Code: \(error._code)")
                                print("Error Messsage: \(error.localizedDescription)")
                                
                                if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
                                    print("Server Error: " + str)
                                }
                                debugPrint(error as Any)
                                print("===========================\n\n\n")
                                
                                UserDefaults.standard.set("\((response.response?.statusCode)!)", forKey: "AppStatusCode")
                                UserDefaults.standard.synchronize()
                                
                                completion(error, nil)
                            }
                            break
                        
                        
                        
                        case .success(let value):
                            print("webResponse===\(value)")

                            guard let data = response.data else { return }
                            print(data)

                            do{
                                let imageModel = try JSONDecoder().decode(responseModel.self, from: data)
                                completion(nil, imageModel)
                                
                            }catch let error{
                                print(error)
                                completion(error, nil)
                            }
                            break
                    }
                    
                }
        }
    }

}
