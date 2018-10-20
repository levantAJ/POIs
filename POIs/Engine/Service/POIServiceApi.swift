//
//  POIServiceApi.swift
//  POIs
//
//  Created by levantAJ on 20/10/18.
//  Copyright © 2018 levantAJ. All rights reserved.
//

import CoreLocation

protocol POIServiceApiProtocol {
    func get(southwest: CLLocationCoordinate2D,
             northeast: CLLocationCoordinate2D,
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
    func get(southwest: CLLocationCoordinate2D,
             northeast: CLLocationCoordinate2D,
             completion: @escaping (Response<[POI]>) -> Void) {
        if let url = URL(string: "https://codetest18292.mvlchain.io/pois?sw=\(southwest.latitude),\(southwest.longitude)&ne=\(northeast.latitude),\(northeast.longitude)") {
            serviceRequester.request(url: url, completion: completion)
        } else {
            let error = APIError.urlIsInvalid.error
            completion(.failure(error))
        }
    }
}
