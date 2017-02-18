//
//  fifthViewController.swift
//  Demo_swift
//
//  Created by devloper65 on 2/16/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit
import MapKit

class fifthViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UIGestureRecognizerDelegate {

    var label = UILabel()
    var anotation1 = MKPointAnnotation()
    var anotation2 = MKPointAnnotation()
    var anotation = MKPointAnnotation()
    var locationmanager = CLLocationManager()
    var a : CLLocationCoordinate2D!
    var b : CLLocationCoordinate2D!
    var cord : String!
    var c = 0
    var route : MKRoute!
    var loc : String!
    var ph : String!

    @IBOutlet var mapview: MKMapView!
    @IBOutlet var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        mapview.delegate = self
        
        locationmanager.delegate = self
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest
        locationmanager.requestWhenInUseAuthorization()
        locationmanager.requestLocation()
        
//        let a = locationmanager.location!.coordinate.latitude
//        let b = locationmanager.location!.coordinate.longitude
//         let locationmake = CLLocationCoordinate2DMake((locationmanager.location?.coordinate.latitude)!, (locationmanager.location?.coordinate.longitude)!)
        
        let locationmake = 	CLLocationCoordinate2D(latitude: 40.7128, longitude: 74.0059)
//
        anotation1.coordinate = locationmake
        anotation1.title = "Start"
        mapview.addAnnotation(anotation1)
        
        cord = String(describing: anotation.coordinate.latitude)
        print(cord)
        anotation2.coordinate = anotation.coordinate
        anotation2.title = "End"
        mapview.addAnnotation(anotation2)
        
        displayRegion()
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureReconizer:)))
        lpgr.minimumPressDuration = 0.5
        lpgr.delaysTouchesBegan = true
        lpgr.delegate = self
        self.mapview.addGestureRecognizer(lpgr)
        
        routes()
        
//        let location = 	CLLocationCoordinate2D(latitude: 21.1702, longitude: 72.8311)
//        anotation1.coordinate = location
//        anotation1.title = "Surat"
//        mapview.addAnnotation(anotation1)
//        
//        let location1 = CLLocationCoordinate2D(latitude: 20.9467, longitude: 72.9520)
//        anotation2.coordinate = location1
//        anotation2.title = "Navsari"
//        mapview.addAnnotation(anotation2)
//        
//        let span = MKCoordinateSpanMake(0.05, 0.05)
//        let region = MKCoordinateRegion(center: location, span: span)
//        mapview.setRegion(region, animated: true)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Button action
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapview.mapType = .standard
        case 1:
            mapview.mapType = .satellite
        default: // or case 2
            mapview.mapType = .hybrid
        }
    }
    
    func routes() {
        let req = MKDirectionsRequest()
        let start = MKPlacemark(coordinate: CLLocationCoordinate2DMake(anotation1.coordinate.latitude, anotation1.coordinate.longitude),addressDictionary: nil)
        
        let end = MKPlacemark(coordinate: CLLocationCoordinate2DMake(anotation2.coordinate.latitude, anotation2.coordinate.longitude), addressDictionary: nil)
        
        req.source = MKMapItem(placemark: start)
        req.destination = MKMapItem(placemark: end)
        req.requestsAlternateRoutes = true
        req.transportType = .automobile
        
        let direction = MKDirections(request: req)
        
        direction.calculate(completionHandler: {
            response, error in
            if error == nil {
                if self.c == 0{
                    self.route = response!.routes[0] as MKRoute
                    self.mapview.add(self.route.polyline)
                    self.c += 1
                }else {
                    self.mapview.remove(self.route.polyline)
                    self.route = response!.routes[0] as MKRoute
                    self.mapview.add(self.route.polyline)
                }
            }else{
                print("error")
            }
        })
    }
    
    func displayRegion() {
        if(cord == "0.0")
        {
            mapview.setRegion(MKCoordinateRegionMake(anotation1.coordinate, MKCoordinateSpanMake(0.7,0.7)), animated: true)
            
        }
        else{
            mapview.setRegion(MKCoordinateRegionMake(anotation2.coordinate, MKCoordinateSpanMake(0.7,0.7)), animated: true)
        }
}
    
    //MARK: - Map Delegate
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer{
        
        let polylinerender = MKPolylineRenderer(polyline: route.polyline)
        polylinerender.strokeColor = UIColor.blue
        polylinerender.lineWidth = 5
        
        return polylinerender
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let t = String(self.route.expectedTravelTime)
       
        let dist = String(route.distance)
        if(loc != nil){
            let ac = UIAlertController(title: "Welcome to \(loc) \n Distance: \(dist) \n Estimate Time: \(t)", message: ph, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
        else{
            let ac = UIAlertController(title: "Distance: \(dist) \n Estimate Time: \(t)", message: "", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }

    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(anotation is MKPointAnnotation) {
            return nil
        }
        
        let anoid = "AnotationId"
        var anoview = mapview.dequeueReusableAnnotationView(withIdentifier: anoid)
        if anoview == nil {
            anoview = MKAnnotationView(annotation: anotation, reuseIdentifier: anoid)
            anoview?.canShowCallout = true
        }else {
            anoview?.annotation = anotation
        }
        
        let pinimage = UIImage(named: "pin1")
        anoview?.image = pinimage
        anoview?.isEnabled = true
        anoview?.canShowCallout = true
        let btn = UIButton(type: .detailDisclosure)
        anoview?.rightCalloutAccessoryView = btn
        return anoview
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("OVER")
    }
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("Start")
    }
    
    //Mark: - location Delegate
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            locationmanager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

    }
    
    //Mark: - Gesture Delegate
    func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizerState.ended {
            let touchLocation = gestureReconizer.location(in: mapview)
            let locationCoordinate = mapview.convert(touchLocation,toCoordinateFrom: mapview)
            anotation.coordinate = locationCoordinate
            let ac = UIAlertController(title: "You tapped at", message: "Latitude:\(locationCoordinate.latitude)  Longitude: \(locationCoordinate.longitude)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
            self.viewDidLoad()
            return
        }
        if gestureReconizer.state != UIGestureRecognizerState.began {
            return
        }
        
    }
}
