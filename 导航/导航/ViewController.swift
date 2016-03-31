//
//  ViewController.swift
//  导航
//
//  Created by czljcb on 16/3/11.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    lazy var coder: CLGeocoder = CLGeocoder()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        coder.geocodeAddressString("广州") { (clps: [CLPlacemark]?,error: NSError?) -> Void in
            
            let gzclp = clps?.first
            self.coder.geocodeAddressString("深圳") { (clps: [CLPlacemark]?,error: NSError?) -> Void in
                
                let szclp = clps?.first
                
                
                let startPlacemark = MKPlacemark(placemark: gzclp!)
                let starTiem = MKMapItem(placemark: startPlacemark)
                
                
                let endPlacemark = MKPlacemark(placemark: szclp!)
                let endTiem = MKMapItem(placemark: endPlacemark)
                
                let mapItems: [MKMapItem] = [starTiem,endTiem]
                let options : [String : AnyObject] = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsMapTypeKey: MKMapType.Standard.rawValue ,MKLaunchOptionsShowsTrafficKey: true]
                MKMapItem.openMapsWithItems(mapItems, launchOptions: options)
                
            }
            
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

