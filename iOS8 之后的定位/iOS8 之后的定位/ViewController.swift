//
//  ViewController.swift
//  iOS8 之后的定位
//
//  Created by czljcb on 16/3/10.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    // MARK: - 属性
    
    // MARK: - 方案1  locationMgr.requestWhenInUseAuthorization() backround models update location
                    // 添加 NSLocationWhenInUseUsageDescription key 到 info.plist
    // MARK: - 方案2  locationMgr.requestAlwaysAuthorization()
    //                    // 添加 NSLocationAlwaysUsageDescription key 到 info.plist



    lazy var locationMgr: CLLocationManager = {
       
        let locationMgr = CLLocationManager()
        locationMgr.delegate = self
        
        if #available(iOS 8.0, *)
        {
            //locationMgr.requestWhenInUseAuthorization()
            locationMgr.requestAlwaysAuthorization()

        }
        
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
        
        print("5555")
    }
}