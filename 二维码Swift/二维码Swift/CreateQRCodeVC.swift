//
//  CreateQRCodeVC.swift
//  二维码Swift
//
//  Created by czljcb on 16/3/19.
//  Copyright © 2016年 lQ. All rights reserved.
//

import UIKit

class CreateQRCodeVC: UIViewController {

    
    @IBOutlet weak var imagView: UIImageView!
    
    @IBOutlet weak var textView: UITextView!

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
      imagView.image = QRCodeTool.imageWiteQRCode("www.baidu.com", imageSize: 300, logoImage: UIImage(named: "AppIcon"), logoSzie: 80)
        
        //imagView.image = Tool.generateBarCode("233344", size: CGSize(width: 100, height: 100), color: UIColor.blackColor(), backGroundColor: UIColor.whiteColor())
        
        //imagView.image = Tool.qrImageWithString("33333", size: CGSize(width: 100, height: 100), color: nil, backGroundColor: nil)
    }
    
    
    
    

}




