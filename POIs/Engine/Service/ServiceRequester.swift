//
//  ServiceRequester.swift
//  POIs
//
//  Created by levantAJ on 20/10/18.
//  Copyright © 2018 levantAJ. All rights reserved.
//

import Alamofire
import Foundation

enum Response<T> {
    case success(T)
    case failure(Error)
}

protocol ServiceRequestable {
    func request<T: Decodable>(url: URL, completion: @escaping (Response<[T]>) -> ())
}

final class ServiceRequester {}

// MARK: - ServiceRequestable

extension ServiceRequester: ServiceRequestable {
    func request<T>(url: URL, completion: @escaping (Response<[T]>) -> ()) where T : Decodable {
        let dataRequest = Alamofire.request(url)
        dataRequest.responseData { response in
            if let error = response.error {
                completion(.failure(error))
            } else if let data = response.data {
                do {
                    let decoder = JSONDecoder()
                    let objects = try decoder.decode([T].self, from: data)
                    completion(.success(objects))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}

extension Constant {
    struct ServiceRequester {
        static let Host = "https://codetest18292.mvlchain.io"
    }
}
