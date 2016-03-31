//
//  ViewController.swift
//  监听区域
//
//  Created by czljcb on 16/3/10.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    lazy var location: CLLocationManager = {
        
        let location = CLLocationManager()
        location.delegate = self
        if     #available(iOS 8.0, *){
            location.requestAlwaysAuthorization()
            if     #available(iOS 9.0, *){
                location.allowsBackgroundLocationUpdates = true
                
            }
            
        }
        
        
        return location
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if CLLocationManager.isMonitoringAvailableForClass(CLCircularRegion.self){
            let center = CLLocationCoordinate2D(latitude: 12.12, longitude: 12.12)
            let region = CLCircularRegion(center: center, radius: 100000, identifier: "json")
            
            location.startMonitoringForRegion(region)

        }
        
        
        location.startUpdatingLocation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: CLLocationManagerDelegate{
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last)
    }
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print(region.identifier)
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        print(region.identifier)
    }
}