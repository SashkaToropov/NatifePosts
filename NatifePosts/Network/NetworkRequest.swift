//
//  NetworkRequest.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 27.11.2023.
//

import Foundation

final class NetworkRequest {
    
    static let shared = NetworkRequest()
    
    private init() {}
    
    func getData(of endpoint: EndPoint, completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.request(endpoint) { data, _, error in
            DispatchQueue.main.async {
                if error != nil {
                    completionHandler(.failure(.invalidURL))
                } else {
                    guard let data else { return }
                    completionHandler(.success(data))
                }
            }
        }

    }
}
