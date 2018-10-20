//
//  POIServiceApi.swift
//  POIs
//
//  Created by levantAJ on 20/10/18.
//  Copyright © 2018 levantAJ. All rights reserved.
//

import CoreLocation

protocol POIServiceApiProtocol {
    func get(bottomLeftCoordinate: CLLocationCoordinate2D,
             topRightCoordinate: CLLocationCoordinate2D,
             completion: @escaping (Response<[POI]>) -> Void)
}

final class POIServiceApi {
    let serviceRequester: ServiceRequestable
    
    init(serviceRequester: ServiceRequestable) {
        self.serviceRequester = serviceRequester
    }
}

//MARK: - POIServiceApiProtocol

extension POIServiceApi: POIServiceApiProtocol {
    func get(bottomLeftCoordinate: CLLocationCoordinate2D,
             topRightCoordinate: CLLocationCoordinate2D,
             completion: @escaping (Response<[POI]>) -> Void) {
        if let url = URL(string: "https://codetest18292.mvlchain.io/pois?sw=\(bottomLeftCoordinate.latitude),\(bottomLeftCoordinate.longitude)&ne=\(topRightCoordinate.latitude),\(topRightCoordinate.longitude)") {
            serviceRequester.request(url: url, completion: completion)
        } else {
            let error = APIError.urlIsInvalid.error
            completion(.failure(error))
        }
    }
}
