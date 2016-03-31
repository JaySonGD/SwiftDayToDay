//
//  ViewController.swift
//  获取通信录2
//
//  Created by czljcb on 16/3/18.
//  Copyright © 2016年 lQ. All rights reserved.
//

import UIKit
import AddressBook

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if ABAddressBookGetAuthorizationStatus() == ABAuthorizationStatus.NotDetermined{
            
            let book = ABAddressBookCreate().takeRetainedValue()
            ABAddressBookRequestAccessWithCompletion(book, { (flag: Bool,error: CFError!) -> Void in
                
                if flag {
                    print("授权成功")
                }else{
                    print("授权失败")
                }
            })
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if ABAddressBookGetAuthorizationStatus() != ABAuthorizationStatus.Authorized{
            
            print("用户没有授权")
            return
        }
        
        let book =  ABAddressBookCreate().takeRetainedValue()
        let peoples  = ABAddressBookCopyArrayOfAllPeople(book).takeRetainedValue()
        
        let count = CFArrayGetCount(peoples)
        
        for i in 0..<count {
            let record =
            unsafeBitCast(CFArrayGetValueAtIndex(peoples, i)
                , ABRecordRef.self)
            
            
           let name = (ABRecordCopyValue(record, kABPersonFirstNameProperty).takeRetainedValue() as! String) +
            (ABRecordCopyValue(record, kABPersonLastNameProperty).takeRetainedValue() as! String)
            print(name)
            
            let phones: ABMultiValueRef = ABRecordCopyValue(record, kABPersonPhoneProperty).takeRetainedValue() as ABMultiValueRef
            
            let count = ABMultiValueGetCount(phones)
            
            for i in 0..<count{
                
                
               print( ABMultiValueCopyLabelAtIndex(phones, i).takeRetainedValue() )
               print( ABMultiValueCopyValueAtIndex(phones, i).takeRetainedValue() )
            }
            
            
        }
        
    }
    
}

