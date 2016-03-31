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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: MKMapViewDelegate{
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        //print(userLocation.location?.coordinate)
        
        //mapView.setCenterCoordinate((userLocation.location?.coordinate)!, animated: true)
        
        mapView.userLocation.title = "Json"
        mapView.userLocation.subtitle = "czljcb"
        
        let span = MKCoordinateSpan(latitudeDelta: 0.0741179875659827, longitudeDelta: 0.0621865116864046)
        let region = MKCoordinateRegion(center: (userLocation.location?.coordinate)!, span: span)
        mapView.setRegion(region, animated: true)
        
        
        let annotation = CZAnnotation(coordinate: userLocation.coordinate, title: "json", subtitle: "czljcb")
        mapView.addAnnotation(annotation)

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