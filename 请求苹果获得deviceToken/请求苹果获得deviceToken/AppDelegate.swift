//
//  AppDelegate.swift
//  请求苹果获得deviceToken
//
//  Created by czljcb on 16/3/15.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        if #available(iOS 8.0, *)
        {
            let type = UIUserNotificationType.Alert.rawValue | UIUserNotificationType.Badge.rawValue | UIUserNotificationType.Sound.rawValue
            
            let setting = UIUserNotificationSettings(forTypes: UIUserNotificationType(rawValue: type), categories: nil)
            
            UIApplication.sharedApplication().registerUserNotificationSettings(setting)
            UIApplication.sharedApplication().registerForRemoteNotifications()
        }
        else
        {
            let type = UIRemoteNotificationType.Alert.rawValue | UIRemoteNotificationType.Sound.rawValue | UIRemoteNotificationType.Badge.rawValue
            
            UIApplication.sharedApplication().registerForRemoteNotificationTypes(UIRemoteNotificationType(rawValue: type))
        }
        
        guard let tempOptions = launchOptions else { return true }
        // 意味着用户是通过点击远程推送通知, 启动的我们APP
        if tempOptions[UIApplicationLaunchOptionsRemoteNotificationKey] != nil
        {
            print("接收到远程推送通知, 以后开发当中, 需要在这里, 处理launchOptions")
        }
        

        
        return true
    }
    
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        
        print("已经收到Apple--deviceToken, 然后发送给公司自己的服务器,服务器拿着deviceToken发送为Apple",deviceToken)
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print("请求失败Apple--deviceToken",error)
    }
    
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
//             当接收到推送通知之后, 并且满足一下条件
//        app 在前台时
//        app 从后台进入到前台 (App一开始在后台, app 锁屏)
//        如果app 完全退出, 这时候,如果用户点击通知, 打开APP , 不会调用这个方法, 会调用didFinishLaunchingWithOptions
        print("接收到远程推送通知")

    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        print("接收到远程推送通知")
//        当接收到推送通知之后, 并且满足一下条件
//        当我们实现, 这个方法时, 上面一个方法不再执行
//        计时APP 完全退出, 也会调用这个方法
//        completionHandler : 统计我们处理的时间, 耗电量, 刷新预览图片
//        
//        效果: 当用户收到通知之后, 即使没有点击也会调用这个方法
//        条件: 1 .需要勾选后台模式 remote notification
//        2. 必须保证发送的推送通知格式, 包括  "content-available":"随便传"
//        3. 执行completionHandler 回调代码块
//        {"aps" :
//            {
//                "alert" : "This is some fancy message.",
//                "badge":1,
//                "content-available":"随便传"
//            }
//        }
        completionHandler(UIBackgroundFetchResult.NewData)
        
    }
}

