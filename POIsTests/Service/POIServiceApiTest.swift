//
//  POIServiceApiTest.swift
//  POIsTests
//
//  Created by levantAJ on 21/10/18.
//  Copyright © 2018 levantAJ. All rights reserved.
//

import XCTest
import CoreLocation
@testable import POIs

class POIServiceApiTest: XCTestCase {
    
    var serviceRequester: MockedServiceRequester!
    var sut: POIServiceApi!

    func testGet() {
        //Given:
        serviceRequester = MockedServiceRequester()
        sut = POIServiceApi(serviceRequester: serviceRequester)
        
        //When:
        sut.get(bottomLeftCoordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0), topRightCoordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0)) { _ in }
        
        //Then:
        XCTAssertTrue(serviceRequester.didRequest)
    }

}
