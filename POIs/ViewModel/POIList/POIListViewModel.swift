//
//  POIListViewModel.swift
//  POIs
//
//  Created by levantAJ on 20/10/18.
//  Copyright © 2018 levantAJ. All rights reserved.
//

import CoreLocation
import GoogleMaps

protocol POIListViewModelProtocol {
    var addedMarkers: OptionalValueBinder<[GMSMarker]> { get set }
    func retrievePOIs(bottomLeftCoordinate: CLLocationCoordinate2D, topRightCoordinate: CLLocationCoordinate2D)
}

final class POIListViewModel {
    var addedMarkers: OptionalValueBinder<[GMSMarker]> = OptionalValueBinder()
    var allMarkers: [String: GMSMarker] = [:]
    let poiService: POIServiceApiProtocol
    
    init(poiService: POIServiceApiProtocol) {
        self.poiService = poiService
    }
}

// MARK: - POIListViewModelProtocol

extension POIListViewModel: POIListViewModelProtocol {
    func retrievePOIs(bottomLeftCoordinate: CLLocationCoordinate2D,
                      topRightCoordinate: CLLocationCoordinate2D) {
        poiService.get(bottomLeftCoordinate: bottomLeftCoordinate,
                       topRightCoordinate: topRightCoordinate) { [weak self] response in
                        guard let strongSelf = self else { return }
                        switch response {
                        case .success(let pois):
                            //Clean invisible marker
                            strongSelf.clearInvisibleMarkers(bottomLeftCoordinate: bottomLeftCoordinate,
                                                             topRightCoordinate: topRightCoordinate)
                            
                            //Add unique markers
                            strongSelf.add(pois: pois)
                            
                        case .failure(let error):
                            //TODO: Show error message
                            debugPrint(error.localizedDescription)
                        }
        }
    }
}

// MARK: - Privates

extension POIListViewModel {
    private func clearInvisibleMarkers(bottomLeftCoordinate: CLLocationCoordinate2D,
                                       topRightCoordinate: CLLocationCoordinate2D) {
        let cleaningMarkers = allMarkers.values
        for marker in cleaningMarkers {
            if marker.position.latitude < bottomLeftCoordinate.latitude
                || marker.position.longitude < bottomLeftCoordinate.longitude
                || marker.position.longitude > topRightCoordinate.longitude
                || marker.position.latitude > topRightCoordinate.latitude {
                marker.map = nil
                allMarkers[marker.identifier] = nil
            }
        }
    }
    
    private func add(pois: [POI]) {
        var addingMarkers: [GMSMarker] = []
        for poi in pois {
            guard let marker = POIMarker(poi: poi).gmsMarker else { continue }
            if allMarkers[marker.identifier] == nil {
                addingMarkers.append(marker)
                allMarkers[marker.identifier] = marker
            }
        }
        addedMarkers.value = addingMarkers
    }
}

// MARK: - Factorable

extension POIListViewModel: Factorable {
    static func create() -> POIListViewModel {
        let serviceRequester = ServiceRequester()
        let poiService = POIServiceApi(serviceRequester: serviceRequester)
        return POIListViewModel(poiService: poiService)
    }
}
