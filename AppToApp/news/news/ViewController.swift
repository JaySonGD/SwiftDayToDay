//
//  ViewController.swift
//  news
//
//  Created by czljcb on 16/3/16.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let delegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        guard let urlStr =  delegate.scheme  else{
            return
        }
        
        guard let url = NSURL(string: urlStr + "://") else{
            return
        }
        
        if UIApplication.sharedApplication().canOpenURL(url){
            UIApplication.sharedApplication().openURL(url)
        }
        
    }

}

