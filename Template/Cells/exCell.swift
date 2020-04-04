//
//  exCell.swift
//  Template
//
//  Created by Mac on 30.09.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit
class exCell: UITableViewCell {
       var AnasayfaKonuName: UILabel = {
           let lbl = UILabel()
           lbl.textColor = UIColor.white
           return lbl
       }()
       var AnasayfaKonuYazar: UILabel = {
           let lbl2 = UILabel()
           lbl2.textColor = UIColor.white
           return lbl2
       }()
       let anaView : UIView = {
           let view = UIView()
           view.backgroundColor = UIColor.darkGray
           
           view.frame = CGRect(x: 5, y: 0, width: screenWith - 10, height: 95.0)
           CustomizeItems.referance.roundedView25(with: view)
           return view
       }()

       override func awakeFromNib() {
           super.awakeFromNib()
       }
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style , reuseIdentifier: reuseIdentifier)
           AnasayfaKonuName.frame = CGRect(x: 10, y: 5, width: anaView.frame.size.width, height: 30)
           AnasayfaKonuYazar.frame = CGRect(x: 10, y: 40, width: anaView.frame.size.width, height: 30)
           anaView.addSubview(AnasayfaKonuName)
           anaView.addSubview(AnasayfaKonuYazar)
           self.addSubview(anaView)
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

           // Configure the view for the selected state
       }
}
