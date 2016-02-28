//
//  ViewController.swift
//  Swift - 函数的使用
//
//  Created by czljcb on 16/2/26.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dict = [String : AnyObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - 无参数无返回
    //    func iHaveADrean() -> (){
    //        print("无参数无返回")
    //    }
    func iHaveADrean(){
        print("无参数无返回")
    }
    
    
    //    func iHaveADrean(myType : String) -> (){
    //        print("无参数无返回--\(myType)")
    //    }
    func iHaveADrean(myType : String){
        print("无参数无返回--\(myType)")
    }
    
    
    // MARK: - 默认第二个参数为外部参数
    //    func iHaveADrean(myType : String , iOSSource: Int) -> (String){
    //        print("无参数无返回--\(myType) -- \(iOSSource)")
    //        return "java"
    //    }
    
    // MARK: --- 添加第一个外部参数
    //    func iHaveADrean(myType myType : String , iOSSource: Int) -> (String){
    //        print("无参数无返回--\(myType) -- \(iOSSource)")
    //        return "java"
    //    }
    // MARK: - 默认参数
    func iHaveADrean( myType : String = "json" , iOSSource: Int) -> (String){
        print("无参数无返回--\(myType) -- \(iOSSource)")
        return "java"
    }
    
    //    func youHaveADrean() -> (String){
    //        return "C#"
    //    }
    func youHaveADrean() -> String{
        return "C#"
    }
    
    


    // MARK: - 可变参数
    func hisHaveADrean(myTypes : String...){
        
        for myType in myTypes{
            print(myType)
        }
    }
    
    var study = "ios"
    
    // MARK: - 默认是常量
    //    func lean(st : String)
    func lean(var st : String)
    {
        st = "os"// 默认是常量
    }
    
    // MARK: - 指针传递
    func myStudy(inout st : String)
    {
        st = "java"
    }
    
    // MARK: - 函数嵌套
    func test(){
        
        func demo(){
            print("demo")
        }
        print("test")
        
        demo()
    }
    
    // MARK: - event
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        iHaveADrean()
        iHaveADrean("iOS")
        //        print(iHaveADrean("ios", iOSSource: 99))
        print(iHaveADrean(iOSSource: 9))
        //        print(iHaveADrean(myType: <#T##String#>, iOSSource: <#T##Int#>))
        print(youHaveADrean())
        
        hisHaveADrean("ios","c#","java")
        
        myStudy(&study)
        print(study)
    }
    
}

