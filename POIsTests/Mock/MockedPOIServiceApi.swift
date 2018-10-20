//
//  MockedPOIServiceApi.swift
//  POIsTests
//
//  Created by levantAJ on 21/10/18.
//  Copyright © 2018 levantAJ. All rights reserved.
//

import CoreLocation
@testable import POIs

class MockedPOIServiceApi {
    var didGet = false
}

extension MockedPOIServiceApi: POIServiceApiProtocol {
    func get(bottomLeftCoordinate: CLLocationCoordinate2D, topRightCoordinate: CLLocationCoordinate2D, completion: @escaping (Response<[POI]>) -> Void) {
        didGet = true
    }
}
