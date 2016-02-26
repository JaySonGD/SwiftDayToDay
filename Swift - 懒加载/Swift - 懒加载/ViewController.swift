//
//  ViewController.swift
//  Swift - 懒加载
//
//  Created by czljcb on 16/2/26.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // ********************************************************************************************************
    // MARK: - < 懒加载 >

    lazy var dataPlist : [Int] = {
        
        print("第一次加载数据")
        return [12,34 ,67]
    }()
    
    
    lazy var apps : [String : AnyObject] = {
        
        print("第一次加载数据")
        return ["name" : "czljcb" , "age" : 12]
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
        
        print(dataPlist)
        print(apps)
    }
}

