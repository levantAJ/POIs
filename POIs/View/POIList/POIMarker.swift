//
//  POIMarker.swift
//  POIs
//
//  Created by levantAJ on 20/10/18.
//  Copyright © 2018 levantAJ. All rights reserved.
//

import GoogleMaps

struct POIMarker {
    let poi: POI
    
    init(poi: POI) {
        self.poi = poi
    }
    
    var gmsMarker: GMSMarker? {
        guard let name = poi.name,
            let lat = poi.latitude,
            let long = poi.longitude,
            let type = poi.type else { return nil }
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: lat, longitude: long))
        let markerView = POIMarkerView.create()
        markerView.title = name
        switch type {
        case .airport:
            markerView.icon = UIImage(named: "airport")
        case .hotel:
            markerView.icon = UIImage(named: "hotel")
        }
        marker.iconView = markerView
        return marker
    }
}
