//
//  HTTPTool.swift
//  Swift - 闭包
//
//  Created by czljcb on 16/2/26.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class HTTPTool: NSObject {
    
    var url :String?
    var myBlock : ((String) -> ())?

    
    func load(myBlock :(String) -> ()){
        
        self.myBlock = myBlock
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            
            print("\(NSThread.currentThread())")
            print("发送数据请求")
            dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                print("\(NSThread.currentThread())")
                print("更新UI")
                
                myBlock("json")
            })
            
        }
        
    }
    
    
}
