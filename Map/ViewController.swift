//
//  ViewController.swift
//  Map_76
//
//  Created by devloper65 on 2/15/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManager {

    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let locate = CLLocationManager()
        
        locate.delegate = self
        locate.desiredAccuracy = kCLLocationAccuracyBest
        locate.requestWhenInUseAuthorization()
        locate.requestLocation()
        
        let location = CLLocationCoordinate2D(latitude: 21.1702, longitude:72.8311)
        
        // 2
        let span = MKCoordinateSpanMake(0.02, 0.02)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        //3
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Big Ben"
        annotation.subtitle = "London"
        mapView.addAnnotation(annotation)
    }
    
    func location


}

