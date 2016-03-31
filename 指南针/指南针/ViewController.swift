//
//  ViewController.swift
//  指南针
//
//  Created by czljcb on 16/3/10.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    lazy var location: CLLocationManager = {
       
        var location = CLLocationManager()
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
        if CLLocationManager.headingAvailable(){
            location.startUpdatingHeading()

        }else{
            print("设备不支持")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: CLLocationManagerDelegate{
    func locationManager(manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print(newHeading)
    }

}