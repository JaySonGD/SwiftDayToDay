//
//  ViewController.swift
//  计步器
//
//  Created by czljcb on 16/3/15.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

   //lazy var step = CMStepCounter()
    lazy var step = CMPedometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     /*
        
        if !CMStepCounter.isStepCountingAvailable(){
            print("设备不支持")
        }
        
        step.queryStepCountStartingFrom(NSDate(timeIntervalSinceNow: -24 * 60 * 60), to: NSDate(), toQueue: NSOperationQueue.mainQueue()) { (step: Int,error: NSError?) -> Void in
            
            if error == nil{
                print("step = \(step)")
            }
        }
        
        step.startStepCountingUpdatesToQueue(NSOperationQueue.mainQueue(), updateOn: 0) { (step: Int,date: NSDate,error: NSError?) -> Void in
            if error == nil{
            print("setp = \(step) , date = \(date)")
            }
        }
        
//        step.stopStepCountingUpdates()
    
*/
        
        if !CMPedometer.isStepCountingAvailable(){
            print("设备不支持")
        }
        
        step.startPedometerUpdatesFromDate(NSDate(timeIntervalSinceNow: -24 * 60 * 60)) { (data:CMPedometerData?,error: NSError?) -> Void in
            if error == nil{
                print("setp = \(data?.numberOfSteps)")
            }
        }
    }
    
    
}

