//
//  CustomMenus.swift
//  Template
//
//  Created by Mac on 15.11.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class CustomMenus: UIViewController {
    private var button = DefaultItems.referance.defButton(withText: "Animate", andButtonColor: .blue)
//    private var arrow = ArrowView(frame: CGRect(x: 20, y: screenHeigth  / 2 , width: screenWith - 40, height: 400))
    private var arraw = customShapes(frame: CGRect(x: 20, y: (screenHeigth  / 2) - 200, width: screenWith - 40, height:400))
    private var reverseAnimation = true
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupViews()
        self.setupFrameWithPhone(withdeviceName: getDeviceModel())
        animateFrameWith(deviceName: getDeviceModel())
    }
    @objc func animatebuttonTapped(){
        self.reverseAnimation.toggle()
        self.arraw.animate()
//        let (leadingPercentage, trailingPercentage) = self.reverseAnimation ? (Int8(0), Int8(0)) : (Int8(50), Int8(50))
    }

}

extension CustomMenus:SetUpViews{
    func setupViews() {
        self.arraw.setup(fillColor: .purple,shapeType: .Custom)
        self.button.frame = CGRect(x: 20, y: 40, width: screenWith - 40, height: 50)
        self.button.addTarget(self, action: #selector(animatebuttonTapped), for: .touchUpInside)
        self.view.addSubview(self.button)
        self.view.addSubview(self.arraw)
    }
    func setupFrameWithPhone(withdeviceName: PhoneType) {
        
    }
    func animateFrameWith(deviceName: PhoneType) {
      
    }
    
    
}
