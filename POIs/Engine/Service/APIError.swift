//
//  APIError.swift
//  POIs
//
//  Created by levantAJ on 20/10/18.
//  Copyright © 2018 levantAJ. All rights reserved.
//

import Foundation

enum APIError: Int {
    case urlIsInvalid = -1
    
    var code: Int {
        return rawValue
    }
    
    var description: String {
        switch self {
        case .urlIsInvalid:
            return NSLocalizedString("URL Is Invalid", comment: "")
        }
    }
    
    var error: Error {
        return NSError(domain: "com.levantAJ.POIs.error", code: code, userInfo: [NSLocalizedDescriptionKey: description])
    }
}
