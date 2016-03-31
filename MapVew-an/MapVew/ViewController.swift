//
//  ViewController.swift
//  MapVew
//
//  Created by czljcb on 16/3/11.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    
    lazy var locationM: CLLocationManager = {
        
        let locationM = CLLocationManager()
        return locationM
    }()
    
    lazy var coder: CLGeocoder = CLGeocoder()
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.delegate = self
        //mapView.mapType = .Standard
        //mapView.scrollEnabled = !true
        //mapView.zoomEnabled = !true
        
        mapView.showsUserLocation = true
        //mapView.userTrackingMode = .Follow // youbug
        
        
        locationM.requestAlwaysAuthorization()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let point = touches.first?.locationInView(mapView)
        let coordinate = mapView.convertPoint(point!, toCoordinateFromView: mapView)
        
        let annotation = CZAnnotation(coordinate: coordinate, title: "json", subtitle: "czljcb")
        mapView.addAnnotation(annotation)
        
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        coder.reverseGeocodeLocation(location) { (clps: [CLPlacemark]?,error: NSError?) -> Void in
            annotation.title = clps?.first?.name
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: MKMapViewDelegate{
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        
        
        // MARK: - 系统
        //                let ID = "id"
        //                var annotationView = (mapView.dequeueReusableAnnotationViewWithIdentifier(ID) as? MKPinAnnotationView)
        //
        //
        //
        //                if (annotationView == nil){
        //                    annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: ID)
        //                }
        //                annotationView?.annotation = annotation
        //                //annotationView?.pinTintColor = UIColor.orangeColor()
        //                annotationView?.canShowCallout = true
        //                //annotationView?.animatesDrop = true
        //                annotationView?.image = UIImage(named: "category_1")
        
        
        // MARK: -  自定义的 "标记模型"
        if annotation.isKindOfClass(CZAnnotation.self)
        {
            let ID = "id"
            var annotationView = (mapView.dequeueReusableAnnotationViewWithIdentifier(ID))
            
            
            if (annotationView == nil){
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: ID)
            }
            annotationView?.annotation = annotation
            annotationView?.canShowCallout = true
            annotationView?.image = UIImage(named: "category_2")
            
            annotationView?.detailCalloutAccessoryView = UISwitch()
            annotationView?.detailCalloutAccessoryView?.backgroundColor = UIColor.orangeColor()
            annotationView?.leftCalloutAccessoryView = UISwitch()
            annotationView?.leftCalloutAccessoryView?.backgroundColor = UIColor.redColor()
            annotationView?.rightCalloutAccessoryView = UISwitch()
            annotationView?.rightCalloutAccessoryView?.backgroundColor = UIColor.yellowColor()
            //annotationView?.backgroundColor = UIColor.blackColor()
            annotationView?.centerOffset = CGPoint(x: 20, y: 20)
            annotationView?.calloutOffset = CGPoint(x: -20, y: -20)
            return annotationView;
        }
        // 返回一个空，标记模型 对应 标记视图 由系统决定
        return nil;
        
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        print(view.annotation?.coordinate)
    }
    
    func mapView(mapView: MKMapView, didAddAnnotationViews views: [MKAnnotationView]) {
        print(views)
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        //print(userLocation.location?.coordinate)
        
        //mapView.setCenterCoordinate((userLocation.location?.coordinate)!, animated: true)
        
        //        mapView.userLocation.title = "Json"
        //        mapView.userLocation.subtitle = "czljcb"
        //
        //        let span = MKCoordinateSpan(latitudeDelta: 0.0741179875659827, longitudeDelta: 0.0621865116864046)
        //        let region = MKCoordinateRegion(center: (userLocation.location?.coordinate)!, span: span)
        //        mapView.setRegion(region, animated: true)
        //
        //
        //        let annotation = CZAnnotation(coordinate: userLocation.coordinate, title: "json", subtitle: "czljcb")
        //        mapView.addAnnotation(annotation)
        
    }
    
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        //print(   mapView.region.span)
    }
    
    func mapViewDidFailLoadingMap(mapView: MKMapView, withError error: NSError) {
        // print("加载mapView失败",error)
    }
    
    func mapViewDidFinishLoadingMap(mapView: MKMapView) {
        // print("加载完成mapView",mapView)
    }
}