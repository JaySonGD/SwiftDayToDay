//
//  AppDelegate.swift
//  本地通知
//
//  Created by czljcb on 16/3/14.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        if #available(iOS 8.0, *) {
            let type = UIUserNotificationType.Alert.rawValue | UIUserNotificationType.Sound.rawValue | UIUserNotificationType.Badge.rawValue
            
            let category:UIMutableUserNotificationCategory = UIMutableUserNotificationCategory()
            category.identifier = "select"
            
            
            let action = UIMutableUserNotificationAction()
            action.identifier = "jijie"
            action.title = "拒接"
            action.activationMode = UIUserNotificationActivationMode.Foreground
            action.authenticationRequired = true
            action.destructive = true
            
            let action1 = UIMutableUserNotificationAction()
            action1.identifier = "tongyi"
            action1.title = "同意"
            action1.activationMode = UIUserNotificationActivationMode.Background
            action1.authenticationRequired = !true
            action1.destructive = false
            
            if #available(iOS 9.0, *) {
                action1.behavior = UIUserNotificationActionBehavior.TextInput
            }
            
            category.setActions([action,action1], forContext: UIUserNotificationActionContext.Default)

            let categories: Set<UIUserNotificationCategory> = [category]
            let setting = UIUserNotificationSettings(forTypes: UIUserNotificationType(rawValue: type), categories: categories)
            UIApplication.sharedApplication().registerUserNotificationSettings(setting)
        }
        
        guard let launchOption = launchOptions else {return true}
        
        if launchOption[UIApplicationLaunchOptionsLocalNotificationKey] != nil{
            
            print("用户通过在app关闭的状态通过通知消息进入app")
        }
        
        let text = UITextView(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        text.text = launchOption.description
        text.backgroundColor = UIColor.orangeColor()
        window?.rootViewController?.view.addSubview(text)
        
        return true
    }


    func applicationWillResignActive(application: UIApplication) {
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
    }


    // MARK: - 在前台 后台/锁屏 进入前台（点击通知）
    
    // MARK: - 关闭app , 点击通知不会来到此 , 不过会通过didFinishLaunchingWithOptions,传入相关参数
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
       print("本地通知",notification.userInfo)
        if UIApplication.sharedApplication().applicationState == UIApplicationState.Active{
            print("前台接收到通知")
        }else if UIApplication.sharedApplication().applicationState == UIApplicationState.Inactive{
            print("后台进入前台接收到通知--->> 直接展示相关消息界面")

        }
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
        print("点击了\(identifier)")
        completionHandler()
    }
    
    /// ios9
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, withResponseInfo responseInfo: [NSObject : AnyObject], completionHandler: () -> Void) {
        
        print("点击了\(identifier)",responseInfo)
        completionHandler()

        
    }
}

