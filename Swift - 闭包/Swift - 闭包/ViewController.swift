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
        
        self.tool = tool
        
        // MARK: - 闭包格式      (参数类型) -> (返回值类型)
        // var myBlock : ( (String) -> () )?

        
        // MARK: - 常用写法
        //        tool.load { (data : String) -> () in
        //
        //            print(data)
        //        }
        //
        // MARK: - 方式2
        
        //        tool.load ({ (data : String) -> () in
        //
        //            print("888\(data)")
        //        })
        
        // MARK: - 方式3
        
        //        tool.load (){ (data : String) -> () in
        //            print("9999\(data)")
        //            self.view.backgroundColor = UIColor.orangeColor()
        //        }
        
        // MARK: - 最直接方式
        
        //        weak var weakSelf : ViewController? = self
        //
        //
        //        tool.load (){ (data : String) -> () in
        //            print("9999\(data)")
        //            weakSelf!.view.backgroundColor = UIColor.orangeColor()
        //        }
        
        
        // MARK: - 最直接方式（简写）
        
        //                tool.load (){[weak self] (data : String) -> () in
        //                    print("9999\(data)")
        //                    self!.view.backgroundColor = UIColor.orangeColor()
        //                }
        
        
        
        // MARK: - 不安全方式（viewController delloc 时 指针不清空，永远指着那一块地址）
        
        tool.load (){[unowned self] (data : String) -> () in
            print("9999\(data)")
            self.view.backgroundColor = UIColor.orangeColor()
        }
        
    }
    
    
    
    // MARK: - 相当于OC delloc
    deinit{
        print("delloc")
    }
    
    
}

