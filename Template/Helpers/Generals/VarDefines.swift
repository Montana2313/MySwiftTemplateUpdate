//
//  VarDefines.swift
//  Template
//
//  Created by Mac on 7.04.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit

let screenWith = UIScreen.main.bounds.width
let screenHeigth = UIScreen.main.bounds.height


// RENK Tanımlamaları
let masterColor = UIColor.white


// Font Tanımlamaları
let exapmleFont = UIFont(name: "Helvetica", size: 20.0)


// Diğer Değiken Tanımlamlamaları
var currentUserId : String {
    get{
//        return Auth.auth().currentUser!.uid
         return ""
    }
}
