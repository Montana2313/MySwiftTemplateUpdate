//
//  CustomLoginScreen.swift
//  Template
//
//  Created by Mac on 13.11.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

class CustomLoginScreen {
    private var view = UIView()
    private var borderColor = UIColor()
    private var buttonColors = UIColor()
    //
    private var currentSatus : LoginScreen = .Login
    private var logoImage = UIImageView()
    private var compLogoImage = UIImageView()
    private var loginView = UIView()
    private var loginUsernameLabel = UILabel()
    private var loginPasswordLabel = UILabel()
    private var loginUsernameTextField = UITextField()
    private var loginPassowrdTextField = UITextField()
    //
    private var kayitView = UIView()
    private var kayitEmailLabel = UILabel()
    private var kayitUsernameLabel = UILabel()
    private var kayitPasswordLabel = UILabel()
    private var kayitEmail = UITextField()
    private var kayitUsername = UITextField()
    private var kayitPassword = UITextField()
    private var kayitPassword2 = UITextField()
    private var loginButton = UIButton()
    private var kayitolButton = UIButton()
    init(borderColor:UIColor,buttoncolor:UIColor) {
        self.borderColor = borderColor
        self.buttonColors = buttoncolor
    }
    func setView(currentView:UIView){
        self.view = currentView
        setupViews()
        setupFrameWithPhone(withdeviceName: getDeviceModel())
        animateFrameWith(deviceName: getDeviceModel())
    }
   @objc func kayitOlTapped() {
        if self.currentSatus == .CreateUser{
            print("Kayıt işlemleri")
        }
        else {
             UIView.animate(withDuration: 1.0) {
                    self.loginView.frame = CGRect(x: 20, y: screenHeigth + 100, width: screenWith - 40, height: screenHeigth - 250)
                    self.kayitView.frame = CGRect(x: 20, y: 50, width: screenWith - 40, height: 430)
                    self.currentSatus = .CreateUser
            }
        }
   }
    @objc func girisYapTapped(){
        if self.currentSatus == .Login {
            print("Giriş işlemleri")
        }else {
            UIView.animate(withDuration: 1.0) {
                self.loginView.frame = CGRect(x: 20, y: 50, width: screenWith - 40, height: screenHeigth - 250)
                       
                self.kayitView.frame = CGRect(x: 20, y: screenHeigth + 100, width: screenWith - 40, height: 430)
                self.currentSatus = .Login
            }
        }
    }
}
extension CustomLoginScreen:SetUpViews{
    func setupViews() {
        self.loginView = {
             let view = DefaultItems.referance.defView(withColor: .white)
             return view
         }()
         self.loginUsernameLabel = {
             let label = DefaultItems.referance.defLabel(withText: "Kullanıcı adınız.", andLabelColor: .black)
             label.textAlignment = .center
             return label
         }()
         self.loginPasswordLabel = {
             let label = DefaultItems.referance.defLabel(withText: "Şifreniz.", andLabelColor: .black)
             label.textAlignment = .center
             return label
         }()
         self.loginUsernameTextField = {
            let txt = DefaultItems.referance.defTextField(withPlaceHolder: "Kullanıcı adı", andHolderColor: .black)
            txt.layer.borderWidth = 4.0
            txt.layer.borderColor = self.borderColor.cgColor
             return txt
         }()
         self.loginPassowrdTextField = {
            let txt = DefaultItems.referance.defTextField(withPlaceHolder: "Şifre", andHolderColor: .black)
            txt.layer.borderWidth = 4.0
             txt.isSecureTextEntry = true
            txt.layer.borderColor = self.borderColor.cgColor
             return txt
         }()
         self.compLogoImage = {
             let imageView = UIImageView()
             imageView.image = UIImage(named: "logoclear")
             imageView.backgroundColor = .clear
             return imageView
         }()
         self.kayitolButton = {
            let button = DefaultItems.referance.defButton(withText: "Kayit ol", andButtonColor: self.buttonColors)
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(kayitOlTapped), for: .touchUpInside)
            return button
         }()
         self.loginButton = {
            let button = DefaultItems.referance.defButton(withText: "Giriş Yap", andButtonColor: self.buttonColors)
             button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(girisYapTapped), for: .touchUpInside)
             return button
         }()
         // diğer
         self.kayitView = {
             let view = DefaultItems.referance.defView(withColor: .white)
             return view
         }()
         self.kayitEmailLabel = {
             let label = DefaultItems.referance.defLabel(withText: "Email adresiniz", andLabelColor: .black)
             label.textAlignment = .center
             return label
         }()
         self.kayitUsernameLabel = {
             let label = DefaultItems.referance.defLabel(withText: "Kullanıcı adınız", andLabelColor: .black)
             label.textAlignment = .center
             return label
         }()
         self.kayitPasswordLabel = {
             let label = DefaultItems.referance.defLabel(withText: "Şifreniz", andLabelColor: .black)
             label.textAlignment = .center
             return label
         }()
         self.kayitEmail = {
             let txt = DefaultItems.referance.defTextField(withPlaceHolder: "Email adresiniz", andHolderColor: .black)
            txt.layer.borderWidth = 4.0
            txt.keyboardType = .emailAddress
            txt.layer.borderColor = self.borderColor.cgColor
             return txt
         }()
         self.kayitUsername = {
             let txt = DefaultItems.referance.defTextField(withPlaceHolder: "Kullanıcı adınız", andHolderColor: .black)
            txt.layer.borderWidth = 4.0
            txt.layer.borderColor = self.borderColor.cgColor
             return txt
         }()
         self.kayitPassword = {
             let txt = DefaultItems.referance.defTextField(withPlaceHolder: "Şifreni.", andHolderColor: .black)
            txt.layer.borderWidth = 4.0
            txt.layer.borderColor = self.borderColor.cgColor
            txt.isSecureTextEntry = true
             return txt
         }()
         self.kayitPassword2 = {
             let txt = DefaultItems.referance.defTextField(withPlaceHolder: "Şifre Onayı", andHolderColor: .black)
            txt.layer.borderWidth = 4.0
             txt.isSecureTextEntry = true
            txt.layer.borderColor = self.borderColor.cgColor
             return txt
         }()
         self.loginView.addSubview(self.loginUsernameLabel)
         self.loginView.addSubview(self.loginUsernameTextField)
         self.loginView.addSubview(self.loginPasswordLabel)
         self.loginView.addSubview(self.loginPassowrdTextField)
         
         self.kayitView.addSubview(self.kayitEmailLabel)
         self.kayitView.addSubview(self.kayitEmail)
         self.kayitView.addSubview(self.kayitUsernameLabel)
         self.kayitView.addSubview(self.kayitUsername)
         self.kayitView.addSubview(self.kayitPasswordLabel)
         self.kayitView.addSubview(self.kayitPassword)
         self.kayitView.addSubview(self.kayitPassword2)
         self.view.addSubview(self.kayitolButton)
         self.view.addSubview(self.loginButton)
         self.view.addSubview(self.compLogoImage)
         self.view.addSubview(self.loginView)
         self.view.addSubview(self.kayitView)
    }
    func setupFrameWithPhone(withdeviceName: PhoneType) {
        self.compLogoImage.frame = CGRect(x: screenWith - 150, y: screenHeigth - 100, width: 200, height: 100)
        self.loginView.frame = CGRect(x: 20, y: screenHeigth + 200, width: screenWith - 40, height: 300)
        self.loginUsernameLabel.frame = CGRect(x: 10, y: 20, width: self.loginView.frame.size.width - 20  , height: 50)
        self.loginUsernameTextField.frame = CGRect(x: 10, y: 80, width: self.loginView.frame.size.width - 20, height: 50)
        self.loginPasswordLabel.frame = CGRect(x: 10, y: 140, width: self.loginView.frame.size.width - 20, height: 50)
        self.loginPassowrdTextField.frame = CGRect(x: 10, y: 200, width: self.loginView.frame.size.width - 20 , height: 50)
        //
        self.kayitView.frame = CGRect(x: 20, y: screenHeigth + 100, width: screenWith - 40, height: 430)
        self.kayitEmailLabel.frame = CGRect(x: 10, y: 20, width: self.kayitView.frame.size.width - 20, height: 40)
        self.kayitEmail.frame = CGRect(x: 10, y: 70, width: self.kayitView.frame.size.width - 20, height: 50)
        self.kayitUsernameLabel.frame = CGRect(x: 10, y: 130, width: self.kayitView.frame.size.width - 20, height: 40)
        self.kayitUsername.frame = CGRect(x: 10, y: 180, width: self.kayitView.frame.size.width - 20, height: 50)
        self.kayitPasswordLabel.frame = CGRect(x: 10, y: 240, width: self.kayitView.frame.size.width - 20, height: 40)
        self.kayitPassword.frame = CGRect(x: 10, y: 290, width: self.kayitView.frame.size.width - 20, height: 50)
        self.kayitPassword2.frame = CGRect(x: 10, y: 350, width: self.kayitView.frame.size.width - 20, height: 50)
        
        self.loginButton.frame = CGRect(x: 20, y: screenHeigth + 250, width: screenWith - 40, height: 50)
        self.kayitolButton.frame = CGRect(x: 20, y: screenHeigth + 190, width: screenWith - 40 , height: 50)
        
        
        CustomizeItems.referance.roundedView25(with: self.loginView)
        CustomizeItems.referance.roundedTextfield25(with: self.loginUsernameTextField)
        CustomizeItems.referance.roundedTextfield25(with: self.loginPassowrdTextField)
        CustomizeItems.referance.roundedButton25(with: self.loginButton)
        CustomizeItems.referance.roundedButton25(with: self.kayitolButton)
        
        CustomizeItems.referance.roundedView25(with: self.kayitView)
        CustomizeItems.referance.roundedTextfield25(with: self.kayitEmail)
        CustomizeItems.referance.roundedTextfield25(with: self.kayitUsername)
        CustomizeItems.referance.roundedTextfield25(with: self.kayitPassword)
        CustomizeItems.referance.roundedTextfield25(with: self.kayitPassword2)
    }
    
    func animateFrameWith(deviceName: PhoneType) {
        UIView.animate(withDuration: 1.0) {
            if deviceName != .iPhone8{
                self.loginView.frame = CGRect(x: 20, y: 200, width: screenWith - 40, height: screenHeigth - 450)
                self.loginButton.frame = CGRect(x: 20, y: screenHeigth - 150, width: screenWith - 40, height: 50)
                self.kayitolButton.frame = CGRect(x: 20, y: screenHeigth - 90, width: screenWith - 40 , height: 50)
            }else {
                self.loginView.frame = CGRect(x: 20, y: 50, width: screenWith - 40, height: screenHeigth - 250)
                self.loginButton.frame = CGRect(x: 20, y: screenHeigth - 150, width: screenWith - 40, height: 50)
                self.kayitolButton.frame = CGRect(x: 20, y: screenHeigth - 90, width: screenWith - 40 , height: 50)
            }
            
        }
    }
}
