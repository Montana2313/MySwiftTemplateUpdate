//
//  CustomAlerts.swift
//  Template
//
//  Created by Mac on 28.11.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit
class CustomAlerts {
    static let referance = CustomAlerts()
    
    func createDefaultAlert(withTitle:String , andDesc:String , andButtonTitle:String)->UIAlertController{
        let alertController = UIAlertController(title: withTitle, message: andDesc, preferredStyle: .alert)
        let actionButton = UIAlertAction(title: andButtonTitle, style: .cancel, handler: nil)
        alertController.addAction(actionButton)
        return alertController
    }
    
    func createCustomAlertviewwithDefaultButton(withCurrent:UIView,andColor:UIColor,desc:String,buttonDesc:String,buttonColor:UIColor)->UIView{
        let view = DefaultItems.referance.defView(withColor: andColor)
        let button = DefaultItems.referance.defButton(withText: buttonDesc, andButtonColor: buttonColor)
        let label = DefaultItems.referance.defLabel(withText: desc, andLabelColor: .black)
        label.numberOfLines = 2
        label.textAlignment = .center
        
        view.frame = CGRect(x: 20, y: (screenHeigth / 2) - 200, width: screenWith - 40, height: 400)
        
        label.frame = CGRect(x: 10, y: 100, width: view.frame.width - 20, height: 100)
        button.frame = CGRect(x: 20, y: 320, width: view.frame.width - 40, height: 50)
        view.addSubview(button)
        view.addSubview(label)
        return view
    }
}
