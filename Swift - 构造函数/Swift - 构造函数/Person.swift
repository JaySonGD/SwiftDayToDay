//
//  Person.swift
//  Swift - 构造函数
//
//  Created by czljcb on 16/2/26.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name : String?
    var age : Int = 0
    
    override init() {
        ////
        ////        name = "json"
        ////        age = 23
    }
    
    init(name : String , age : Int) {
        self.name = name
        self.age = age
    }
    
    //    init(dict : [String : AnyObject]) {
    //
    //        name = dict["name"] as? String
    //        age = dict["age"] as! Int
    //
    //    }
    
    init(dict : [String : AnyObject]) {
        
        super.init()
        setValuesForKeysWithDictionary(dict)
        
    }
    
    // MARK : --- 对于数据模型中缺少的、不能与任何键配对的属性的时候，系统会自动调用这个方法
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        print("000\(value)---999\(key)")
    }
    
    // MARK : --- setValuesForKeysWithDictionary() 会掉用setValue(<#T##value: AnyObject?##AnyObject?#>, forKey: <#T##String#>)
    override func setValue(value: AnyObject?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    
    
    override func setValue(value: AnyObject?, forKeyPath keyPath: String) {
        
    }
    
    override func valueForUndefinedKey(key: String) -> AnyObject? {
        print(key)
        return nil
    }
    
}
