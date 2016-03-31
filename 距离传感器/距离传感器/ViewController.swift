//
//  ViewController.swift
//  距离传感器
//
//  Created by czljcb on 16/3/15.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UIDevice.currentDevice().proximityMonitoringEnabled = true
        
        if !UIDevice.currentDevice().proximityMonitoringEnabled{
            print("传感器不可用")
            return
        }
        
        NSNotificationCenter.defaultCenter() .addObserver(self, selector: "StateDidChange", name: UIDeviceProximityStateDidChangeNotification, object: nil)
        
        
    }

    
    func StateDidChange(){
        if  UIDevice.currentDevice().proximityState{
            print("有物体靠近")
        }
        else{
            print("有物体离开")

        }
    }
    
}

