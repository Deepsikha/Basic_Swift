//
//  fifthViewController.swift
//  Demo_swift
//
//  Created by devloper65 on 2/16/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit
import MapKit

class fifthViewController: UIViewController, MKMapViewDelegate {

    var label = UILabel()
    var anotation1 = MKPointAnnotation()
    var anotation2 = MKPointAnnotation()

    @IBOutlet var mapview: MKMapView!
    @IBOutlet var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapview.delegate = self
        self.navigationController?.navigationBar.isHidden = false
        
        let location = 	CLLocationCoordinate2D(latitude: 21.1702, longitude: 72.8311)
        anotation1.coordinate = location
        anotation1.title = "Surat"
        mapview.addAnnotation(anotation1)
        
        let location1 = CLLocationCoordinate2D(latitude: 20.9467, longitude: 72.9520)
        anotation2.coordinate = location1
        anotation2.title = "Navsari"
        mapview.addAnnotation(anotation2)
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapview.setRegion(region, animated: true)

        routes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
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
        
        req.destination = MKMapItem(placemark: MKPlacemark(coordinate: anotation1.coordinate,addressDictionary: nil))
        req.source = MKMapItem(placemark: MKPlacemark(coordinate: anotation2.coordinate, addressDictionary: nil))
        req.requestsAlternateRoutes = true
        req.transportType = .automobile
        
        let direction = MKDirections(request: req)
        
        direction.calculate { [unowned self] response, error in
            guard let unwrappedResponse = response else { return }
            
            if (unwrappedResponse.routes.count > 0) {
                self.mapview.add(unwrappedResponse.routes[1].polyline)
                self.mapview.setVisibleMapRect(unwrappedResponse.routes[1].polyline.boundingMapRect, animated: true)
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer{
        
        let polylinerender = MKPolygonRenderer(overlay: overlay)
        polylinerender.strokeColor = UIColor.red
        polylinerender.lineWidth = 5
        
        return polylinerender

    }
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("OVER")
    }
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("Start")
    }
    
}
