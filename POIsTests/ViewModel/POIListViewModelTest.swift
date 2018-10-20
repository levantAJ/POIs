//
//  POIListViewModelTest.swift
//  POIsTests
//
//  Created by levantAJ on 21/10/18.
//  Copyright © 2018 levantAJ. All rights reserved.
//

import CoreLocation
import XCTest
import GoogleMaps
@testable import POIs

class POIListViewModelTest: XCTestCase {
    var sut: POIListViewModel!
    var poiService: MockedPOIServiceApi!
    
    func testRetrievePOIs() {
        //Given:
        poiService = MockedPOIServiceApi()
        sut = POIListViewModel(poiService: poiService)
        
        //When:
        sut.retrievePOIs(bottomLeftCoordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0), topRightCoordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0))
        
        //Then:
        XCTAssertTrue(poiService.didGet)
    }
}
