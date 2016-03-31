//
//  ViewController.swift
//  应用跳转
//
//  Created by czljcb on 16/3/16.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        //        guard let url = NSURL(string: "http://www.baidu.com") else{return}
        //
        //        if UIApplication.sharedApplication().canOpenURL(url) {
        //
        //            UIApplication.sharedApplication().openURL(url)
        //        }
        
        guard let url = NSURL(string: "prefs:root=General&path=Keyboard") else{
            print("转换失败")
            return
        }
        
                if UIApplication.sharedApplication().canOpenURL(url) {
        
                    UIApplication.sharedApplication().openURL(url)
                }
                else{
                    print("打不开")
        }

        /*
        
        Music Equalizer — prefs:root=MUSIC&path=EQ
        Music VolumeLimit— prefs:root=MUSIC&path=VolumeLimit
        Nike + iPod — prefs:root=NIKE_PLUS_IPOD
        Network — prefs:root=General&path=Network
        Notification — prefs:root=NOTIFICATIONS_ID
        Notes — prefs:root=NOTES
        Music — prefs:root=MUSIC
        Phone — prefs:root=Phone  Photos — prefs:root=Photos
        Profile — prefs:root=General&path=ManagedConfigurationList
        Sounds — prefs:root=Sounds
        Siri — prefs:root=General&path=Assistant
        Safari — prefs:root=Safari
        Reset — prefs:root=General&path=Reset
        Wallpaper — prefs:root=Wallpaper
        VPN — prefs:root=General&path=Network/VPN
        Twitter — prefs:root=TWITTER  Usage — prefs:root=General&path=USAGE
        Store — prefs:root=STORE
        SoftwareUpdate— prefs:root=General&path=SOFTWARE_UPDATE_LINK
        Location Services — prefs:root=LOCATION_SERVICES
        Wi-Fi — prefs:root=WIFISetting—prefs:root=INTERNET_TETHERING
        International — prefs:root=General&path=INTERNATIONAL
        iCloud — prefs:root=CASTLE  iCloud
        Storage & Backup — prefs:root=CASTLE&path=STORAGE_AND_BACKUP
        General— prefs:root=General
        Keyboard — prefs:root=General&path=Keyboard
        FaceTime — prefs:root=FACETIME
        Date& Time — prefs:root=General&path=DATE_AND_TIME
        Bluetooth — prefs:root=General&path=Bluetooth
        Brightness — prefs:root=Brightness
        Auto-Lock — prefs:root=General&path=AUTOLOCK
        Accessibility — prefs:root=General&path=ACCESSIBILITY
        AirplaneModeOn— prefs:root=AIRPLANE_MODE
        About — prefs:root=General&path=About   */
        
        
    }
    
}

