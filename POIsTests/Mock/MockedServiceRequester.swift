//
//  MockedServiceRequester.swift
//  POIsTests
//
//  Created by levantAJ on 21/10/18.
//  Copyright © 2018 levantAJ. All rights reserved.
//

import Foundation
@testable import POIs

class MockedServiceRequester {
    var didRequest = false
}

extension MockedServiceRequester: ServiceRequestable {
    func request<T>(url: URL, completion: @escaping (Response<[T]>) -> ()) where T : Decodable {
        didRequest = true
    }
}
