//
//  ViewController.swift
//  Swift - 累的基本使用
//
//  Created by czljcb on 16/2/26.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let p = Person()
        p.mathScore = 89.0
        p.chineseScore = 79.0
        print(p.avr)
        
        if let tempName = p.name{
            print(tempName)
        }
        
        print(Person.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

