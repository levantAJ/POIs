//
//  POI.swift
//  POIs
//
//  Created by levantAJ on 20/10/18.
//  Copyright © 2018 levantAJ. All rights reserved.
//

enum POIType: String, Codable {
    case airport
    case hotel
}

struct POI: Codable {
    var type: POIType?
    var name: String?
    var latitude: Double?
    var longitude: Double?
}
