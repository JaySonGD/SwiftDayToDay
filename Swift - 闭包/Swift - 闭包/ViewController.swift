//
//  ViewController.swift
//  Swift - 闭包
//
//  Created by czljcb on 16/2/26.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tool : HTTPTool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       let tool = HTTPTool()
        
//        tool.url = "223"
//        tool.load { (data : String) -> () in
//            
//            print(data)
//        }
//        
//        tool.load ({ (data : String) -> () in
//            
//            print("888\(data)")
//        })
        
        
//        weak var weakSelf : ViewController? = self
//        
//        
//        tool.load (){ (data : String) -> () in
//            print("9999\(data)")
//            weakSelf!.view.backgroundColor = UIColor.orangeColor()
//        }
        
        
//        
//                tool.load (){[weak self] (data : String) -> () in
//                    print("9999\(data)")
//                    self!.view.backgroundColor = UIColor.orangeColor()
//                }
        
        
        
        
        tool.load (){[unowned self] (data : String) -> () in
            print("9999\(data)")
            self.view.backgroundColor = UIColor.orangeColor()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    deinit{
       print("delloc")
    }


}

