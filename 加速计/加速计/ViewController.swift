//
//  ViewController.swift
//  加速计
//
//  Created by czljcb on 16/3/15.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    lazy var motion =  CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        if !motion.accelerometerAvailable{
            print("设备不支持")
        }
        
        motion.accelerometerUpdateInterval = 1
        
        motion.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) { (data: CMAccelerometerData?,error: NSError?) -> Void in
            
            if error == nil{
             print(data?.acceleration)
            }
        }
    
//        motion.startDeviceMotionUpdates() // 只内部更新数据
    
        
    }



}

