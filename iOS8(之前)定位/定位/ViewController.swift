//
//  ViewController.swift
//  定位
//
//  Created by czljcb on 16/3/10.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import CoreLocation


// MARK: - iOS8 之前 后台要 backroundMdemols location updates
//<?xml version="1.0" encoding="UTF-8"?>
//<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
//<plist version="1.0">
//<string>iOS8 之前 弹框 描述</string>
//</plist>

class ViewController: UIViewController {

    
    // MARK: - 属性
    lazy var locationMgr: CLLocationManager = {
       
        let locationMgr = CLLocationManager()
        locationMgr.delegate = self
        return locationMgr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        locationMgr.startUpdatingLocation()
    }


}


extension ViewController: CLLocationManagerDelegate{
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
}
