//
//  ViewController.swift
//  摇一摇
//
//  Created by czljcb on 16/3/15.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        print("start")
    }

    override func motionCancelled(motion: UIEventSubtype, withEvent event: UIEvent?) {
        print("cancel")
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        print("end")
    }
}

