//
//  ViewController.swift
//  iOS9 之后的定位
//
//  Created by czljcb on 16/3/10.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    //前台
    //1.0 locationMgr.requestWhenInUseAuthorization()

    // 后台
    /* 1.0
    locationMgr.requestWhenInUseAuthorization()
    
    if #available(iOS 9.0, *)
    {
    locationMgr.allowsBackgroundLocationUpdates = true;
    // locationMgr.allowsBackgroundLocationUpdates = true; 必须勾选backround model update location
    
    }*/
    /*2.0
    
    if #available(iOS 8.0, *)
    {
    //info key
    locationMgr.requestAlwaysAuthorization()
    
    if #available(iOS 9.0, *)
    {
    locationMgr.allowsBackgroundLocationUpdates = true;
    // locationMgr.allowsBackgroundLocationUpdates = true; 必须勾选backround model update location
    
    }
    
    }
    
    */
    
    lazy var locationMgr: CLLocationManager = {
        
        let locationMgr = CLLocationManager()
        locationMgr.delegate = self
        if #available(iOS 8.0, *)
        {
            //locationMgr.requestWhenInUseAuthorization() //info key
            locationMgr.requestAlwaysAuthorization()
            
            if #available(iOS 9.0, *)
            {
                locationMgr.allowsBackgroundLocationUpdates = true;
                // locationMgr.allowsBackgroundLocationUpdates = true; 必须勾选backround model update location

            }
            
        }
        
        
        return locationMgr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationMgr.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: CLLocationManagerDelegate{
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("555")
    }
}