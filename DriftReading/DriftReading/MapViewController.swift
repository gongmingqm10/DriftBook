//
//  MapViewController.swift
//  DriftReading
//
//  Created by Ming Gong on 8/19/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, MAMapViewDelegate {

    var mapView: MAMapView?
    var currentLocation:CLLocation?
    var events: [Event]?
    var polylineOverlay: MAGeodesicPolyline?
    var annotations: [MAPointAnnotation] = []

    override func viewDidLoad() {
        initMapView()
    }
    
    override func viewDidAppear(animated: Bool) {
        showRoute()
    }
    
    override func viewDidDisappear(animated: Bool) {
        mapView!.removeOverlay(polylineOverlay)
        mapView!.removeAnnotations(annotations)
    }

    func initMapView() {
        mapView = MAMapView(frame: self.view.bounds)
        mapView!.delegate = self
        self.view.addSubview(mapView!)
        let compassX = mapView?.compassOrigin.x
        let scaleX = mapView?.scaleOrigin.x
        mapView?.compassOrigin = CGPointMake(compassX!, 21)
        mapView?.scaleOrigin = CGPointMake(scaleX!, 21)
        mapView?.showsCompass = true
        mapView!.showsUserLocation = true
        mapView!.userTrackingMode = MAUserTrackingMode.Follow
    }
    
    func showRoute() {
        
        if (events == nil || events?.count == 0) {
            print("No events to show")
            return
        }
        
        var coordinates: [CLLocationCoordinate2D] = []
        
        for event in events! {
            let coordinate = CLLocationCoordinate2D(latitude: (event.address?.latitude)!, longitude: (event.address?.longitude)!)
            coordinates.append(coordinate)
            let annotation = MAPointAnnotation()
            annotation.title = event.address?.info()
            annotation.subtitle = event.content
            annotation.coordinate = coordinate
            annotations.append(annotation)
        }
        mapView?.addAnnotations(annotations)
        polylineOverlay = MAGeodesicPolyline(coordinates: &coordinates, count: UInt(coordinates.count))
        mapView?.addOverlay(polylineOverlay)
        mapView?.centerCoordinate = coordinates.last!
    }

    func mapView(mapView: MAMapView!, didUpdateUserLocation userLocation: MAUserLocation!, updatingLocation: Bool) {
        if updatingLocation {
            currentLocation = userLocation.location
        }
    }
    
    func mapView(mapView: MAMapView, rendererForOverlay overlay: MAOverlay) -> MAOverlayRenderer? {
        
        if overlay.isKindOfClass(MAPolyline) {
            let renderer: MAPolylineRenderer = MAPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor.blueColor()
            renderer.lineWidth = 6.0
            return renderer
        }
        
        return nil
    }
}
