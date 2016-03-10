//
//  ViewController.swift
//  定位
//
//  Created by czljcb on 16/3/10.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {
    
    lazy var locationMgr: CLLocationManager = {
        
        let locationMgr = CLLocationManager()
        locationMgr.delegate = self
        ///
        //locationMgr.distanceFilter = 1000.0
        ///
        //locationMgr.desiredAccuracy = kCLLocationAccuracyBest
        if #available(iOS 8.0, *)
        {
            //locationMgr.requestAlwaysAuthorization()
            locationMgr.requestWhenInUseAuthorization()
            if #available(iOS 9.0, *)
            {
                locationMgr.allowsBackgroundLocationUpdates = true
            }
            
        }
        
        return locationMgr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //if CLLocationManager.locationServicesEnabled(){
        locationMgr.startUpdatingLocation()
        //}
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: CLLocationManagerDelegate{
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        print(location)
        
        if location?.horizontalAccuracy > 0 {
            //manager.stopUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status
        {
            // User has not yet made a choice with regards to this application
        case .NotDetermined:
            print("用户还没确定")
            
            // This application is not authorized to use location services.  Due
            // to active restrictions on location services, the user cannot change
            // this status, and may not have personally denied authorization
        case .Restricted:
            print("限制")
            // User has explicitly denied authorization for this application, or
            // location services are disabled in Settings.
        case .Denied:
            if !CLLocationManager.locationServicesEnabled()
            {
                print("系统限制")
            }
            else
            {
                print("拒绝")
//                if #available(iOS 8.0, *) {
//                    guard let url = NSURL(string: UIApplicationOpenSettingsURLString) else{
//                        return
//                    }
//                    
//                    if UIApplication.sharedApplication().canOpenURL(url){
//                        UIApplication.sharedApplication().openURL(url)
//                    }
//                }
//                else
                //{
                    guard let url: NSURL = NSURL(string: "prefs:root=LOCATION_SERVICES")
                        else
                    {
                        return
                    }
                    if UIApplication.sharedApplication().canOpenURL(url)
                    {
                        UIApplication.sharedApplication().openURL(url)
                    }

                //}
            }
            
            // User has granted authorization to use their location at any time,
            // including monitoring for regions, visits, or significant location changes.
        case .AuthorizedAlways:
            print("前后台")
            
            // User has granted authorization to use their location only when your app
            // is visible to them (it will be made visible to them if you continue to
            // receive location updates while in the background).  Authorization to use
            // launch APIs has not been granted.
        case .AuthorizedWhenInUse:
            print("前台")
        }
    }
}