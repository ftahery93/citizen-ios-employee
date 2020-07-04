//
//  File.swift
//  NetLet
//
//  Created by Mohammed Yusuf Mitha on 04/07/20.
//  Copyright © 2020 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation

import UIKit
import YPImagePicker
import Lightbox
import Alamofire
import SwiftLocation
import CoreLocation
import Alamofire


class ResolveVC: Base {
    var scroll = UIScrollView()
    var imagesArray : YPMediaItem?
    var addImageButton = UIButton()
    
    var reportIssueButton = UIButton()
    var selectedImage : UIImage?
    var issueObject : Issue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = myBackgroundColor
        setUpView()
        
        
     
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
 
        self.scroll.addSubview(reportIssueButton)
        reportIssueButton.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK:- addImageButton
        addImageButton.adjustDefaultButton(fontColor: "#8E8E8E", fontSize: 12, fontType: "1")
        addImageButton.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
        addImageButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        addImageButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        addImageButton.heightAnchor.constraint(equalToConstant: screenWidth).isActive = true
        addImageButton.backgroundColor = .clear
        addImageButton.addTarget(self, action: #selector(addImageButtonAction), for: .touchUpInside)
        addImageButton.setBackgroundImage(UIImage(named: "add_image.png"), for: .normal)
        
        
        //MARK:- reportIssueButton
        reportIssueButton.adjustDefaultButton(fontColor: "#FFFFFF", fontSize: 15, fontType: "2")
        
        reportIssueButton.topAnchor.constraint(equalTo: addImageButton.bottomAnchor, constant: 25*iPhoneFactorX).isActive = true
        reportIssueButton.centerXAnchor.constraint(equalTo: topBar.centerXAnchor).isActive = true
        reportIssueButton.heightAnchor.constraint(equalToConstant:  40*iPhoneFactorX).isActive = true
        reportIssueButton.widthAnchor.constraint(equalToConstant:  240*iPhoneFactorX).isActive = true
        reportIssueButton.backgroundColor = myOrangeColor
        reportIssueButton.setTitle("Resolve Issue", for: .normal)
        reportIssueButton.layer.cornerRadius = 5
        reportIssueButton.addTarget(self, action: #selector(reportIssueButtonAction), for: .touchUpInside)
        
    }
    @objc func reportIssueButtonAction(){
        
        if(imagesArray == nil){
            showToast(toastView: self.view, toastTitle: "Error", toastText: "Please select Image")
            addImageButton.shake()
            return
        }
         
        showLoader()
        var params : [String: Any] = ["file" : convertImageToBase64String(img: selectedImage!),
                                      "id" : "\(issueObject?.id ?? 0)"]
                                    
        var obj001 = [String:Any]()
        obj001 = ["issue" : params]
        params = ["obj001" : obj001]
        
        API.callDictionaryAPI(webserviceFor: StringIdentifiers.postIssue, webMethod: .post, parameters: params) { (error, task) in
            dismissLoader()
            if let task = task as? responseModel{
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        
        
         
    
       
        
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
        let imageData:NSData = img.jpegData(compressionQuality: 0.10)! as NSData //UIImagePNGRepresentation(img)
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
