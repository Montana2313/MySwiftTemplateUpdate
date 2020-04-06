//
//  LoginScreen.swift
//  Template
//
//  Created by Mac on 13.11.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    private let postarray : [PostType] = [PostType]()
    let login = CustomLoginScreen(borderColor: .orange, buttoncolor: .orange)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        login.setView(currentView: self.view)
//        let params:[String:Any]  = ["username":"deneme","email":"ozgur_elmasli1@hotmail.com","password":"montana2313"]
//        DataManager.init(string: "http://localhost:8080/user", type: .POST).requestPOST(params: params)
//        DataManager.init(string: "http://localhost:8080/user", type: .GET).requestGET()
//        let image = UIImage(named: "margot.jpg")
//        if let data = image?.jpegData(compressionQuality: 0.5){
//            let params: [String:Any] = ["postTitle":"post deneme" ,
//                                                    "postSubtitle":"post deneme subtitle",
//                                                    "postImageData":data.base64EncodedString(),
//                                                    "postImageName":"margot.jpg"]
//            DataManager.init(string: "http://localhost:8080/setPost", type: .POST).requestPOST(params: params)
//            DataManager.init(string: "http://localhost:8080/getbyId/2", type: .GET).reqeustPostType()
        
        NotificationCenter.default.addObserver(self, selector: #selector(showImage(notification:)), name: NSNotification.Name("post"), object:nil)
    }
    @objc func showImage(notification:NSNotification){
        if let item = notification.userInfo?["data"] as? PostType{
                if let image = UIImage(data: item.postImageData){
                    let imageView = UIImageView(image: image)
                    imageView.frame = CGRect(x: 0, y: 0, width: screenWith, height: screenHeigth)
                    self.view.addSubview(imageView)
                }
        }
    }
}
