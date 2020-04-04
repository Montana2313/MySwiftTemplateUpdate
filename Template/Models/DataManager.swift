//
//  DataManager.swift
//  Template
//
//  Created by Mac on 13.10.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit
struct UserType {
    var id : Int = 0
    var username:String = ""
    var email:String = ""
    var password:String = ""
   init(_ dictionary: [String: Any]) {
          self.id = dictionary["id"] as? Int ?? 0
          self.username = dictionary["username"] as? String ?? ""
          self.email = dictionary["email"] as? String ?? ""
          self.password = dictionary["password"] as? String ?? ""
    }
}
struct PostType {
    var id : Int = 0
    var postTitle:String = ""
    var postSubtitle:String = ""
    var postImageData:Data = Data()
    var postImageName:String = ""
   init(_ dictionary: [String: Any]) {
          self.id = dictionary["id"] as? Int ?? 0
          self.postTitle = dictionary["postTitle"] as? String ?? ""
          self.postSubtitle = dictionary["postSubtitle"] as? String ?? ""
        self.postImageData = Data(base64Encoded: dictionary["postImageData"] as? String ?? "") ?? Data()
        self.postImageName = dictionary["postImageName"] as? String ?? ""
    }
}
class DataManager {
    private var urlString : String = ""
    private var request:OwnRequestType!
    init(string:String , type:OwnRequestType) {
        self.urlString = string
        self.request = type
    }
    func reqeustPostType(){
        guard let url = URL(string: self.urlString) else{fatalError()}
          var request = URLRequest(url: url)
          request.setValue("application/json", forHTTPHeaderField: "Content-Type")
          request.setValue("application/json", forHTTPHeaderField: "Accept")
          request.httpMethod = self.request.rawValue
          let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
                    if let response = response {
                                       let nsHTTPResponse = response as! HTTPURLResponse
                                       let statusCode = nsHTTPResponse.statusCode
                                       print ("status code = \(statusCode)")
                                   }
                     if let error = err {
                             print ("\(error)")
                     }
                     if let data = data {
                         do{
                          let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
                          print(jsonResponse)
                          DispatchQueue.main.async {
                              guard let  jsonItem = jsonResponse as? [String:Any] else {
                                          return
                            }
                            let model = PostType(jsonItem)
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "post"), object: nil,userInfo: ["data":model])
                          }
                          }catch _ {
                                  print ("OOps not good JSON formatted response")
                          }
                      }
                 }
                 task.resume()
      }
    func requestGET(){
        var model : [UserType] = [UserType]()
        guard let url = URL(string: self.urlString) else{fatalError()}
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = self.request.rawValue
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
                  if let response = response {
                                     let nsHTTPResponse = response as! HTTPURLResponse
                                     let statusCode = nsHTTPResponse.statusCode
                                     print ("status code = \(statusCode)")
                                 }
                   if let error = err {
                           print ("\(error)")
                   }
                   if let data = data {
                       do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
                        print(jsonResponse)
                        DispatchQueue.main.async {
                            guard let  jsonArray = jsonResponse as? [[String:Any]] else {
                                        return
                                }
                                jsonArray.forEach { (dictItem) in
                                        model.append(UserType(dictItem))
                                }
                            print(model)
                        }
                        }catch _ {
                                print ("OOps not good JSON formatted response")
                        }
                    }
               }
               task.resume()
    }
    func requestPOST(params:[String:Any]){
        guard let url = URL(string: self.urlString) else{fatalError()}
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = self.request.rawValue
        let paramaters : [String:Any] = params
        do {
            let jsonParams = try JSONSerialization.data(withJSONObject: paramaters, options: [])
            request.httpBody = jsonParams
            
            
        }catch{print("Error: unable to add parameters to POST request")}
//        burada kaldım
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
           if let response = response {
                              let nsHTTPResponse = response as! HTTPURLResponse
                              let statusCode = nsHTTPResponse.statusCode
                              print ("status code = \(statusCode)")
                          }
            if let error = err {
                    print ("\(error)")
            }
            if let data = data {
                do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
                        print ("data = \(jsonResponse)")
                    }catch _ {
                            print ("OOps not good JSON formatted response")
                    }
                }
        }
        task.resume()
    }
}
