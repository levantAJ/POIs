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
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decode(POIType.self, forKey: .type)
        name = try values.decode(String.self, forKey: .name)
        latitude = Double(try values.decode(String.self, forKey: .latitude))
        longitude = Double(try values.decode(String.self, forKey: .longitude))
    }
}
