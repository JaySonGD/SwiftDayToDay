//
//  AppDelegate.swift
//  Alipay
//
//  Created by czljcb on 16/3/16.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        
        if url.host == "safepay"{
            AlipaySDK.defaultService().processOrderWithPaymentResult(url, standbyCallback: { (resultDic: [NSObject : AnyObject]!) -> Void in
                
                print(resultDic)
            })
        }
        
        
        return true

    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        
        if url.host == "safepay"{
            AlipaySDK.defaultService().processOrderWithPaymentResult(url, standbyCallback: { (resultDic: [NSObject : AnyObject]!) -> Void in
                
                print(resultDic)
            })
        }
        
        
        return true

    }
    
    

    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        
        if url.host == "safepay"{
            AlipaySDK.defaultService().processOrderWithPaymentResult(url, standbyCallback: { (resultDic: [NSObject : AnyObject]!) -> Void in
                
                print(resultDic)
            })
        }
        
        
        return true
    }
}

