//
//  ViewController.swift
//  自定义Log
//
//  Created by czljcb on 16/2/26.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //        print("\(__FUNCTION__)")
        //
        //        print("\((__FILE__ as NSString).lastPathComponent)")
        //
        //        print("\(__LINE__)")
        
        CZLog("4455")
        test(2,  3)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



func test (a : Int , _ b : Int)
{
    
}

func CZLog<T>(message : T,file : String = __FILE__ ,funcName : String = __FUNCTION__, line : Int = __LINE__)
{
    #if DEBUG
        print(" [\((file as NSString).lastPathComponent) -> \(funcName) -> \(line)] \(message)")
    #endif
}
