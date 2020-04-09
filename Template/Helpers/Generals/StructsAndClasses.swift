//
//  StructsAndClasses.swift
//  Template
//
//  Created by Mac on 7.04.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit

struct UserData {
    var id:String = ""
    var username :String = ""
    var email:String = ""
    var userImage:String = ""
    func toString()->String{
        return self.id + " " + self.username + " " + self.email
    }
    init(){
        // do nothing
    }
    init(userId:String , userusername:String , useremail:String , userUserImage:String) {
        self.id = userId
        self.username = userusername
        self.email = useremail
        self.userImage = userUserImage
    }
    func setUser(){
        if self.email != "" && self.id != "" && self.userImage != "" && self.username != ""{
            if email != "" {
                UserDefaults.standard.setValue(email, forKey: "email")
                UserDefaults.standard.synchronize()
            }
            if username != "" {
                UserDefaults.standard.setValue(username, forKey: "username")
                UserDefaults.standard.synchronize()
            }
            if id != "" {
                UserDefaults.standard.setValue(id, forKey: "id")
                UserDefaults.standard.synchronize()
            }
            if userImage != "" {
                UserDefaults.standard.setValue(userImage, forKey: "imageURL")
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    func getUser()->UserData{
        var user = UserData()
        user.email = UserDefaults.standard.string(forKey: "email") ?? ""
        user.username = UserDefaults.standard.string(forKey: "username") ?? ""
        user.id = UserDefaults.standard.string(forKey: "id") ?? ""
        user.userImage = UserDefaults.standard.string(forKey: "imageURL") ?? ""
        return user
    }
    func removeUser() {
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "id")
        UserDefaults.standard.removeObject(forKey: "imageURL")
        UserDefaults.standard.synchronize()
    }
}
class responders: NSObject{
        var viewController : UIViewController? = nil
        @objc func backButtonTapped(){
            getLastViewController().navigationController?.popViewController(animated: true)
        }
        @objc func viewEditing(){
            viewController!.view.endEditing(true)
        }
}
