//
//  Person.swift
//  Swift - 累的基本使用
//
//  Created by czljcb on 16/2/26.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name : String?
    var age : Int = 0
    var mathScore : Double = 0.0
    var chineseScore : Double = 0.0
    
    
    var avr : Double {
        
        
        get{
            return (mathScore + chineseScore) * 0.5
        }
        
        set{
            self.avr = newValue
        }
    }
    
    
    static var count : Int = 0

}
