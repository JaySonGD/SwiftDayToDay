//
//  FromPhoneVC.swift
//  二维码Swift
//
//  Created by czljcb on 16/3/19.
//  Copyright © 2016年 lQ. All rights reserved.
//

import UIKit

class FromPhoneVC: UIViewController {
    
    @IBOutlet weak var sourceImagView: UIImageView!
    
    @IBOutlet weak var QRCImagView: UIImageView!
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        
            QRCImagView.image = QRCodeTool.QRCodeWithImage(sourceImagView.image!)!.image
    }
}


