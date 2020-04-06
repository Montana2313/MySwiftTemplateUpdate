//
//  AddChildViewController.swift
//  Template
//
//  Created by Mac on 6.04.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class AddChildViewController: UIViewController {
       private let loginVC = LoginVC()
       var deneme = false
       let customView =  DefaultItems.referance.defView(withColor: .clear)
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        customView.layer.borderColor = UIColor.blue.cgColor
        customView.layer.borderWidth = 1.0
        customView.frame = CGRect(x: (screenWith / 2 ) - 100, y: (screenHeigth / 2) - 100, width: 100, height: 100)
        customView.isUserInteractionEnabled = true
        CustomizeItems.referance.roundedView25(with: customView)
        let gesture = UITapGestureRecognizer(target:self, action: #selector(action))
        customView.addGestureRecognizer(gesture)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
        self.view.addSubview(customView)
    }
    @objc func action(){
        if self.deneme == false {
            let rotate = CGAffineTransform(rotationAngle: 20.0)
            let scale = CGAffineTransform(scaleX: 3, y: 3)
            let animator = UIViewPropertyAnimator(duration: 1.0, curve:.easeIn) {
                 self.customView.transform = rotate.concatenating(scale).translatedBy(x: 2, y: 2)
            }
            animator.startAnimation()
            self.deneme = true
        }
        else if self.deneme == true {
            let rotate = CGAffineTransform(rotationAngle: 270.0)
                                    let scale = CGAffineTransform(scaleX: 1, y: 1)
                                 UIView.transition(with: self.customView, duration: 1.0, options: .transitionFlipFromBottom, animations: {
                                    self.customView.transform = scale.concatenating(rotate)
            }, completion: nil)
            self.deneme = false
        }
        // 3d sinin öğren
    }
    @objc func tap(){
        self.present(loginVC,animated: true,completion: nil)
    }
    
}

