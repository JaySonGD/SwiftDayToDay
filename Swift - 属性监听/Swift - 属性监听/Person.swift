//
//  Person.swift
//  Swift - 属性监听
//
//  Created by czljcb on 16/2/26.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    static var share: Person = Person()
    
    var name : String?{
        
        willSet{
            print(newValue)
        }
        
        didSet{
            print(oldValue)
            print(name)
        }
    }
    
    var age : Int = 0

}
