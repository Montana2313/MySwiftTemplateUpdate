//
//  exView.swift
//  Template
//
//  Created by Mac on 30.09.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

class exView: UIView {
    private static var referance : exView? = exView()
    static var ref: exView {
        // aslında buarad bir deinit işlmei var
           if referance == nil { referance  = exView() }
           return referance!
    }
    var currentView = UIView() // arka planı karartma işlemi
    var parentView = UIView() // alertin ana ekranı eklemeler buraya yapılır
    override init(frame: CGRect) {
        super.init(frame: frame)
        parentView.backgroundColor = .white
        // item tanıtımları burada olacak
    }
   required init?(coder aDecoder: NSCoder) {
        fatalError("Error occur show alerView")
   }
   func showAlert(with view : UIView)
      {
           let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
           window?.addSubview(self.parentView)
           currentView = view
           currentView.isHidden = true
           UIView.animate(withDuration: 1.0) {
                    self.parentView.frame = CGRect(x: 20, y:(screenHeigth*0.5) - 200, width:screenWith - 40, height: 400)
          }
     }
    @objc func closeTapped() {
           parentView.removeFromSuperview()
           currentView.isHidden = false
           UIView.animate(withDuration: 1.0) {
               self.parentView.frame = CGRect(x: -100, y:-100, width:screenWith - 40, height: 400)
           }
            exView.referance = nil
       }
}
