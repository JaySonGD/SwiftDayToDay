//
//  ViewController.swift
//  地理编码与反编码
//
//  Created by czljcb on 16/3/11.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    
    lazy var coder: CLGeocoder = {
       
        let coder = CLGeocoder()
        return coder
    }()
    
    @IBOutlet weak var jindu: UITextField!
    @IBOutlet weak var weudu: UITextField!
    
    @IBOutlet weak var adderss: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        
        let location = CLLocation(latitude: 23.12517800, longitude: 113.28063700)
        coder.reverseGeocodeLocation(location) {  (clps:[CLPlacemark]?, error: NSError?) -> Void in
            print(clps?.first?.locality)
            print("5555",error)
            
            self.coder.geocodeAddressString("广州") { (clps:[CLPlacemark]?, error: NSError?) -> Void in
                print(clps?.first?.location)
            }
        }
        


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var coderClick: UIButton!

    @IBOutlet weak var encoderClick: UIButton!
}

