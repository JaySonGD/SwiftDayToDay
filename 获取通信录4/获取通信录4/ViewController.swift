//
//  ViewController.swift
//  获取通信录4
//
//  Created by czljcb on 16/3/18.
//  Copyright © 2016年 lQ. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if #available(iOS 9.0, *) {
            if CNContactStore.authorizationStatusForEntityType(CNEntityType.Contacts) == CNAuthorizationStatus.NotDetermined{
                let store = CNContactStore()
                store.requestAccessForEntityType(CNEntityType.Contacts, completionHandler: { (flag: Bool,error: NSError?) -> Void in
                    if flag {
                        print("授权成功")
                    }else{
                        print("授权失败")
                    }
                })
            }
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if #available(iOS 9.0, *) {
            let store = CNContactStore()
            
            let request = CNContactFetchRequest(keysToFetch: [CNContactFamilyNameKey,CNContactGivenNameKey,CNContactPhoneNumbersKey])
            
            do {
                try store.enumerateContactsWithFetchRequest(request, usingBlock: { (contact: CNContact, stop) -> Void in
                    
                    let name = contact.givenName + contact.familyName
                    print(name)
                    
                    let phones = contact.phoneNumbers
                    
                    for phone in phones{
                        print(phone.label)
                        
                        let value: CNPhoneNumber = phone.value as! CNPhoneNumber
                        print(value.stringValue)
                    }
                })
            }
            catch{
                
            }
        }
    }
    
    
}

