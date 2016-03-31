//
//  ViewController.swift
//  本地通知
//
//  Created by czljcb on 16/3/14.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }
    @IBAction func viewAll() {
      print(  UIApplication.sharedApplication().scheduledLocalNotifications)
    }
    @IBAction func cancelAll() {
        UIApplication.sharedApplication().cancelAllLocalNotifications()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let localNotification = UILocalNotification()
        localNotification.alertBody = "jason"
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
        localNotification.applicationIconBadgeNumber = 10
        
        localNotification.hasAction = true
        localNotification.alertAction = "caozhi" // 锁屏 滑动caozhi
        
        localNotification.soundName = "win.aac"
        
//        localNotification.alertLaunchImage = "AppIcon@2x.png"
        
        localNotification.userInfo = ["name": "jason"];
        
        
        if #available(iOS 8.2, *) {
            localNotification.alertTitle = "czljcb" // 下拉通知标题
        }
        
        if #available(iOS 8.0, *) {
            localNotification.category = "select"
        }

        /// 立刻发送
        //UIApplication.sharedApplication().presentLocalNotificationNow(localNotification)
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

