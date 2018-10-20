//
//  POIListViewModel.swift
//  POIs
//
//  Created by levantAJ on 20/10/18.
//  Copyright © 2018 levantAJ. All rights reserved.
//

import CoreLocation

protocol POIListViewModelProtocol {
    var pois: OptionalValueBinder<[POI]> { get set }
    func retrievePOIs(southwest: CLLocationCoordinate2D, northeast: CLLocationCoordinate2D)
}

final class POIListViewModel {
    var pois: OptionalValueBinder<[POI]> = OptionalValueBinder()
    let poiService: POIServiceApiProtocol
    
    init(poiService: POIServiceApiProtocol) {
        self.poiService = poiService
    }
}

// MARK: - POIListViewModelProtocol

extension POIListViewModel: POIListViewModelProtocol {
    func retrievePOIs(southwest: CLLocationCoordinate2D, northeast: CLLocationCoordinate2D) {
        poiService.get(southwest: southwest, northeast: northeast) { [weak self] response in
            guard let strongSelf = self else { return }
            switch response {
            case .success(let pois):
                strongSelf.pois.value = pois
            case .failure(let error):
                //TODO: Show error message
                debugPrint(error.localizedDescription)
            }
        }
    }
}
