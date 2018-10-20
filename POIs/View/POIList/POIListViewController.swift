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
    var viewModel: POIListViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewModel()
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

// MARK: - GMSMapViewDelegate

extension POIListViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        let projection = mapView.projection.visibleRegion()
        let bottomLeftCorner = projection.nearLeft
        let topRightCorner = projection.farRight
        viewModel.retrievePOIs(bottomLeftCoordinate: bottomLeftCorner, topRightCoordinate: topRightCorner)
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        mapView.selectedMarker = marker
        marker.zIndex = 1
        return true
    }
}

// MARK: - Privates

extension POIListViewController {
    private func setUpViews() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        mapView.delegate = self
    }
    
    private func setUpViewModel() {
        viewModel = POIListViewModel.create()
        viewModel.addedMarkers.valueChanged = { [weak self] markers in
            guard let strongSelf = self,
                let markers = markers else { return }
            for marker in markers {
                marker.map = strongSelf.mapView
            }
        }
    }
}
