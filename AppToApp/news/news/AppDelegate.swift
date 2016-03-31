//
//  AppDelegate.swift
//  news
//
//  Created by czljcb on 16/3/16.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var scheme: String?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        
        scheme = url.query
        
        print(url.scheme , url.host ,url.path , url.query)
        
        let nav:UINavigationController = window?.rootViewController as! UINavigationController
        nav.popToRootViewControllerAnimated(!true)
        
        if url.host == "toutiao"{
            
            window?.rootViewController?.childViewControllers.first?.performSegueWithIdentifier("toutiao", sender: nil)
        }
        else if url.host == "tiyu"{
            window?.rootViewController?.childViewControllers.first?.performSegueWithIdentifier("tiyu", sender: nil)

        }
        
        return true
    }

}

