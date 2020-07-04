//
//  network.swift
//  Marasna
//
//  Created by Mohammed Yusuf Mitha on 15/12/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import Foundation
import Alamofire

func guestUser(completion:@escaping (_ error:Error?,_ task:Any?)->Void){
    
    
    let url = Webservices.guestcustomersURL
    
    let headers : HTTPHeaders = ["Content-Type": "application/json-patch+json;",
                                 "Accept": "application/json"]
    
    
    
    AF.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers)
        .responseJSON { (response) in
            
            switch response.result
            {
            case .failure(let error):
                
                if (error._code==NSURLErrorTimedOut) {
                    
                    UserDefaults.standard.set("-1001", forKey: "AppStatusCode")
                    UserDefaults.standard.synchronize()
                    
                    completion(error, nil)
                    
                } else {
                    
                    print("\n\n===========Error===========")
                    print("Error Code: \(error._code)")
                    print("Error Messsage: \(error.localizedDescription)")
                    if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
                        print("Server Error: " + str)
                    }
                    debugPrint(error as Any)
                    print("===========================\n\n")
                    
                    UserDefaults.standard.set("\((response.response?.statusCode)!)", forKey: "AppStatusCode")
                    UserDefaults.standard.synchronize()
                    
                    completion(error, nil)
                    
                }
                
                
                
            case .success(let value):
                print("webResponse=1==\(url)====\(value)")
                
                let data = response.data
                do {
                    
//                    if (url==Webservices.newGuestURL) {
//                        let commentsData = try JSONDecoder().decode(guestResponse.self, from: data!)
//                        completion(nil, commentsData)
//                    }
                    
                } catch let jsonErr {
                    print("jsonErr=1==\(jsonErr)")
                    UserDefaults.standard.set("\((response.response?.statusCode)!)", forKey: "AppStatusCode")
                    UserDefaults.standard.synchronize()
                    
                    completion(jsonErr, nil)
                }
            }
    }
    
}
