//
//  ViewController.swift
//  Swift - 基础语法
//
//  Created by czljcb on 16/2/28.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

// MARK: - 给类型区别名
typealias myInt = Int

class ViewController: UIViewController {
    
    var count : myInt = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

