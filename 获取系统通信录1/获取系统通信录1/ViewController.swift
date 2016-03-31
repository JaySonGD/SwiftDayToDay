//
//  ViewController.swift
//  获取系统通信录1
//
//  Created by czljcb on 16/3/18.
//  Copyright © 2016年 lQ. All rights reserved.
//

import UIKit
import AddressBookUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let VC =  ABPeoplePickerNavigationController()
        VC.peoplePickerDelegate = self
        
        presentViewController(VC, animated: true, completion: nil)
        
    }
    
}


extension ViewController: ABPeoplePickerNavigationControllerDelegate{
    
    func peoplePickerNavigationController(peoplePicker: ABPeoplePickerNavigationController, didSelectPerson person: ABRecord) {
        print(person)
        
        let name = (ABRecordCopyValue(person, kABPersonLastNameProperty).takeRetainedValue() as! String) + (ABRecordCopyValue(person, kABPersonFirstNameProperty).takeRetainedValue() as! String)
        let phones: ABMultiValueRef = ABRecordCopyValue(person, kABPersonPhoneProperty).takeRetainedValue() as ABMultiValueRef
        let count = ABMultiValueGetCount(phones)
        print(name)
        for i in 0..<count {
            print(  ABMultiValueCopyLabelAtIndex(phones, i).takeRetainedValue())
            print(  ABMultiValueCopyValueAtIndex(phones, i).takeRetainedValue())
        }
        
    }
    
//    func peoplePickerNavigationController(peoplePicker: ABPeoplePickerNavigationController, didSelectPerson person: ABRecord, property: ABPropertyID, identifier: ABMultiValueIdentifier) {
//     
//        print(person,property,identifier)
//    }
}