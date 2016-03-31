//
//  ViewController.swift
//  导航2
//
//  Created by czljcb on 16/3/12.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    // MARK: - 属性
    lazy var coder : CLGeocoder = CLGeocoder()
    
    @IBOutlet weak var mapView: MKMapView!
    
    // ********************************************************************************************************
    // MARK: - < 系统回调方法 >
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        coder.geocodeAddressString("广州") { (clps: [CLPlacemark]?,error: NSError?) -> Void in
            let gzls = clps?.first
            
            self.coder.geocodeAddressString("深圳") { (clps: [CLPlacemark]?,error: NSError?) -> Void in
                let szls = clps?.first
                self.getDirection(gzls!, end: szls!)
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let circle =  MKCircle(centerCoordinate: mapView.centerCoordinate, radius: 1000000)
        
        mapView.addOverlay(circle)
    }
    
    // ********************************************************************************************************
    // MARK: - < 自定方法 >
    
    func getDirection(start: CLPlacemark , end: CLPlacemark){
        
        let startPlaceMark = MKPlacemark(placemark: start)
        let startItem = MKMapItem(placemark:startPlaceMark)
        
        let endPlaceMark = MKPlacemark(placemark: end)
        let endItem = MKMapItem(placemark:endPlaceMark)
        
        
        let request = MKDirectionsRequest()
        request.source = startItem
        request.destination = endItem
        
        let direction =  MKDirections(request: request)
        
        direction.calculateDirectionsWithCompletionHandler({ (response: MKDirectionsResponse?,error: NSError?) -> Void in
            print("----",response)
            
            for route in (response?.routes)!{
                
                print(route.name)
                self.mapView.addOverlay(route.polyline)
                
                for step in route.steps{
                    print(step.instructions)
                    
                }
                
            }
            
        })
    }
    
    
}

// MARK: - MKMapViewDelegate
extension ViewController: MKMapViewDelegate{
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        
        
        if overlay.isKindOfClass(MKCircle.self){
            let overlayView =  MKCircleRenderer(overlay: overlay)
            
            overlayView.lineWidth = 2.0
            overlayView.fillColor = UIColor.orangeColor()
            return overlayView
        }
        else
        {
            let overlayView =  MKPolylineRenderer(overlay: overlay)
            
            overlayView.lineWidth = 2.0
            overlayView.strokeColor = UIColor.orangeColor()
            return overlayView
        }
        
    }
    
}
