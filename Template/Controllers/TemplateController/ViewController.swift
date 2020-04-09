//
//  ViewController.swift
//  Template
//
//  Created by Mac on 29.09.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    lazy var denemeButton = UIButton()
    private var denemeTextField = UITextField()
    private var denemeView = UIView()
    private var denemeTableView = UITableView()
    private var denemeAppBar = UIView()
    private var denemetabbar = UIView()
    private var denemeLeftMenu = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = masterColor
        let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert,.sound,.badge]) { (success, error) in
                if error != nil {
                    print("Hata var ")
                }
            }
        let notifContent = UNMutableNotificationContent()
        notifContent.title = "FeedMe"
        notifContent.body = "Koyduğun yemekleri çekerek puan kazan ve puanlarla bağış yap!"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let idString = UUID().uuidString
        let request = UNNotificationRequest(identifier: idString, content: notifContent, trigger: trigger)
        
        center.add(request) { (err) in
            if err != nil{
                print(err?.localizedDescription as Any)
            }
        }
        
        setupViews()
        setupFrameWithPhone(withdeviceName: getDeviceModel())
        animateFrameWith(deviceName: getDeviceModel())

    }
    @objc func denemeTapped(){
        exView.ref.showAlert(with: self.view)
    }
}
extension ViewController : SetUpViews{
    func animateFrameWith(deviceName: PhoneType) {
        UIView.animate(withDuration: 1.0) {
            self.denemeView.frame =  CGRect(x: 10, y: 100, width: screenWith - 20, height: 400)
        }
    }
    
    func setupViews() {
        denemeButton = {
            let btn = DefaultItems.referance.defButton(withText: "Deeneme", andButtonColor: .blue)
            btn.addTarget(self, action: #selector(ViewController.denemeTapped), for: .touchUpInside)
            return btn
        }()
        denemeTextField = {
            let txt = DefaultItems.referance.defTextField(withPlaceHolder: "Deneme", andHolderColor: .black)
            return txt
        }()
        denemeView = {
            let view = DefaultItems.referance.defView(withColor: .green)
            return view
        }()
        denemeTableView = {
            let tableView = DefaultItems.referance.defTableView(with: exCell.self)
            tableView.delegate = self
            tableView.isHidden = true
            tableView.dataSource = self
            return tableView
        }()
        denemeAppBar = {
            let appBar = DefaultItems.referance.defAppBar(withColor: .red, andText: "Deneme", labelcolor: .white)
            let buttonLeft = DefaultItems.referance.defButton(withText: "Left", andButtonColor: .white)
            let buttonRight = DefaultItems.referance.defButton(withText: "Right", andButtonColor: .white)
            appBar.isHidden = true
            CustomizeItems.referance.customAppBarButtons(with: buttonLeft, andRigth: buttonRight, currentView: appBar)
            return appBar
        }()
        denemetabbar = {
            let tabbar = DefaultItems.referance.defTabbar(withColor: .black)
            CustomizeItems.referance.customTabbarSelector(countOfItems: 3, andCurrentView: tabbar, andSelectorColor: .white)
            let button = DefaultItems.referance.defButton(withText: "deneme", andButtonColor: .red)
            let button2 = DefaultItems.referance.defButton(withText: "deneme", andButtonColor: .red)
            let button3 = DefaultItems.referance.defButton(withText: "deneme", andButtonColor: .red)
            CustomizeItems.referance.customTabbarButton(totalItemsCount: 3, itemNumber: 1, buttonItem: button, currentView: tabbar)
            CustomizeItems.referance.customTabbarButton(totalItemsCount: 3, itemNumber: 2, buttonItem: button2, currentView: tabbar)
            CustomizeItems.referance.customTabbarButton(totalItemsCount: 3, itemNumber: 3, buttonItem: button3, currentView: tabbar)
            return tabbar
        }()
        denemeLeftMenu = {
            let button = DefaultItems.referance.defLeftButtonMenu(withimageNamed: "", orColor: .red, andText: "Left")
            return button
        }()
        self.view.addSubview(denemeLeftMenu)
        self.view.addSubview(denemetabbar)
        self.view.addSubview(denemeAppBar)
        self.denemeView.addSubview(denemeTextField)
        self.denemeView.addSubview(denemeButton)
        self.view.addSubview(denemeView)
        self.view.addSubview(denemeTableView)
    }
    func setupFrameWithPhone(withdeviceName: PhoneType) {
        self.denemeView.frame = CGRect(x: 10, y: -500, width: screenWith - 20, height: 400)
        self.denemeButton.frame = CGRect(x: 50, y: 200, width: screenWith - 100, height: 60)
        self.denemeTextField.frame = CGRect(x: 50, y: 280, width: screenWith - 100, height: 60)
        self.denemeTableView.frame = CGRect(x: 0, y: 510, width: screenWith, height: screenHeigth - 510)
        
        CustomizeItems.referance.roundedView25(with: self.denemeView)
        CustomizeItems.referance.roundedButton25(with: self.denemeButton)
        CustomizeItems.referance.roundedTextfield25(with: self.denemeTextField)
    }
}
extension ViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! exCell
        cell.AnasayfaKonuName.text = "deneme"
        cell.AnasayfaKonuYazar.text = "deneme"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

