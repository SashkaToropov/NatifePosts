//
//  NetworkDataFetch.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 27.11.2023.
//

import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()

    private init() {}
    
    func fetchPosts(completionHandler: @escaping (Posts?, NetworkError?) -> Void) {
        NetworkRequest.shared.getData { result in
            switch result {
            case .success(let data):
                do {
                    let posts = try JSONDecoder().decode(Posts.self, from: data)
                    completionHandler(posts, nil) 
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(_):
                completionHandler(nil, .canNotParseData)
            }
        }
    }
}
