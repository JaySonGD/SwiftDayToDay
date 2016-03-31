//
//  ViewController.swift
//  QQ
//
//  Created by czljcb on 16/3/16.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        guard let url = NSURL(string: "news://tiyu?QQ") else{return}
        
        if UIApplication.sharedApplication().canOpenURL(url){
            UIApplication.sharedApplication().openURL(url)
        }
        
    }

}

