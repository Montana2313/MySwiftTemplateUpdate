//
//  Frames.swift
//  Template
//
//  Created by Mac on 17.12.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit
class Frames{
    private var frameheight:CGFloat = 0.0
    private var framewidth:CGFloat = 0.0
    init(width:CGFloat,height:CGFloat) {
        self.frameheight = height
        self.framewidth = width
    }
    //MARK:-> Sol ve sağ işlemleri
    var rightTopItem:CGRect{
          CGRect(x: screenWith - (self.framewidth + 20), y: 50, width: self.framewidth, height: self.frameheight)
    }
    var leftTopItem:CGRect{
        CGRect(x: 20, y: 50, width: self.framewidth, height: self.frameheight)
    }
    var topItemBeyondRigth:CGRect{
        CGRect(x: screenWith + 100, y: 50, width: self.framewidth, height: self.frameheight)
    }
    var topItemBeyondLeft:CGRect{
        CGRect(x: -100, y: 50, width: self.framewidth, height: self.frameheight)
    }
    //bottomLeft
    var leftBottomItem:CGRect{
        CGRect(x: 20, y: screenHeigth - (self.framewidth + 20), width: self.framewidth, height: self.frameheight)
    }
    var rightBottomItem:CGRect{
        CGRect(x: screenWith - (self.framewidth + 20), y: screenHeigth - (self.framewidth + 20), width: self.framewidth, height: self.frameheight)
    }
    var bottomItemBeyondRight:CGRect{
        CGRect(x: screenWith + 100, y: screenHeigth - (self.framewidth + 20), width: self.framewidth, height: self.frameheight)
    }
    var bottomItemBeyondLeft:CGRect{
        CGRect(x: -100, y: screenHeigth - (self.framewidth + 20), width: self.framewidth, height: self.frameheight)
    }
    // aşağı yukarı işlemleri yapıalcak
    var bottomToTopBeyond:CGRect{
        CGRect(x: 0, y: screenHeigth + 100, width: screenWith, height: screenHeigth)
    }
    var bottomToTop:CGRect{
        CGRect(x: 0, y: 0, width: screenWith, height: screenHeigth)
    }
    var topToBottomBeyond:CGRect{
        CGRect(x: 0, y: -screenWith, width: screenWith, height: screenHeigth)
    }
    var topToBottom:CGRect{
        CGRect(x: 0, y: 0, width:screenWith, height: screenHeigth)
    }
}
