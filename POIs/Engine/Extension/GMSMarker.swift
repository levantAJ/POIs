//
//  GMSMarker.swift
//  POIs
//
//  Created by levantAJ on 21/10/18.
//  Copyright © 2018 levantAJ. All rights reserved.
//

import GoogleMaps

extension GMSMarker {
    var identifier: String {
        return "\(position.latitude),\(position.longitude)"
    }
}
