//
//  NetworkDataFetch.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 27.11.2023.
//

import Foundation

final class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()

    private init() {}
    
    func fetchPosts(completionHandler: @escaping (Posts?, NetworkError?) -> Void) {
        NetworkRequest.shared.getData(of: .posts()) { result in
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
    
    func fetchDetailPost(for id: Int, completionHandler: @escaping (DetailPosts?, NetworkError?) -> Void) {
        NetworkRequest.shared.getData(of: .detailPosts(id: id)) { result in
            switch result {
            case .success(let data):
                do {
                    let posts = try JSONDecoder().decode(DetailPosts.self, from: data)
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
