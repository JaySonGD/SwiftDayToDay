//
//  AppDelegate.swift
//  UMDemo
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
        
        // MARK: - 友盟
        UMSocialData.setAppKey("56e97ab667e58e2aaf003278")
        
        
        //UMSocialConfig.hiddenNotInstallPlatforms([UMShareToQQ, UMShareToQzone, UMShareToWechatSession,UMShareToLWTimeline,UMShareToSina])
        
        // MARK: - 微博
        //打开新浪微博的SSO开关，设置新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。
        UMSocialSinaSSOHandler.openNewSinaSSOWithAppKey("1549800356", secret:  "450003f33f79cf72c13d21b5523c7c1e", redirectURL: "http://blog.csdn.net/czljcb")
        
        // MARK: - 微信
        UMSocialWechatHandler.setWXAppId("wxd930ea5d5a258f4f", appSecret: "db426a9829e4b49a0dcac7b4162da6b6", url: nil)
        
        // MARK: - QQ
        
        UMSocialQQHandler.setQQWithAppId("100424468", appKey: "c7394704798a158208a74ab60104f0ba", url: "http://www.umeng.com/social")

        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

