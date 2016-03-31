//
//  ViewController.swift
//  获取通信录3
//
//  Created by czljcb on 16/3/18.
//  Copyright © 2016年 lQ. All rights reserved.
//

import UIKit
import ContactsUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if #available(iOS 9.0, *) {
            let vc = CNContactPickerViewController()
            vc.delegate = self
            presentViewController(vc, animated: true, completion: nil)
            
        }
        
    }
    
}


@available(iOS 9.0, *)
extension ViewController: CNContactPickerDelegate{
    
    func contactPicker(picker: CNContactPickerViewController, didSelectContact contact: CNContact) {
        let name = contact.familyName + contact.middleName + contact.givenName
        print(name)
        
        
        let phones = contact.phoneNumbers
        
        for phone in phones{
            print(phone.label)
            
            let value: CNPhoneNumber = phone.value as! CNPhoneNumber
            print(value.stringValue)
        }
    }
    
}