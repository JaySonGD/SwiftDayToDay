//
//  ViewController.swift
//  Swift - 构造函数
//
//  Created by czljcb on 16/2/26.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let dict = ["name" : "czljcb" , "age" : 23 , "height" : 188]
        
//        let p = Person(name: "json", age: 23)
        let p = Person(dict: dict)
        
        print(p.name!)
        print(p.age)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

