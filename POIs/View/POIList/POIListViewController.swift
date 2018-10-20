//
//  POIListViewController.swift
//  POIs
//
//  Created by levantAJ on 20/10/18.
//  Copyright © 2018 levantAJ. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps


final class POIListViewController: UIViewController {
    @IBOutlet weak var mapView: GMSMapView!
    lazy var locationManager = CLLocationManager() //Component to indicate current location

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
}

// MARK: - CLLocationManagerDelegate

extension POIListViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else { return }
        locationManager.startUpdatingLocation()
        mapView.isMyLocationEnabled = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        locationManager.stopUpdatingLocation()
    }
}

// MARK: - Privates

extension POIListViewController {
    private func setUpViews() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
}
