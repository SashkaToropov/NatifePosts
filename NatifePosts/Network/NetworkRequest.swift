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
    
    func getData(completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.request(.posts) { data, _, error in
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
