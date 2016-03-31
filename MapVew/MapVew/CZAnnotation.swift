//
//  CZAnnotation.swift
//  MapVew
//
//  Created by czljcb on 16/3/11.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import MapKit

class CZAnnotation: NSObject , MKAnnotation{

    // Center latitude and longitude of the annotation view.
    // The implementation of this property must be KVO compliant.
     var coordinate: CLLocationCoordinate2D
    // Title and subtitle for use by selection UI.
     var title: String?
     var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?,subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
    
    
}
