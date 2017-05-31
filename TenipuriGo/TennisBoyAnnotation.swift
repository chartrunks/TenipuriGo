//
//  TennisBoyAnnotation.swift
//  TenipuriGo
//
//  Created by Mac on 5/31/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import MapKit

class TennisBoyAnnotation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var tennisBoy: TennisBoy
    
    init(coord: CLLocationCoordinate2D, tennisBoy: TennisBoy){
        self.coordinate = coord
        self.tennisBoy = tennisBoy
    }
}
