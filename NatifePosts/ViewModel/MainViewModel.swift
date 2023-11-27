//
//  MainViewModel.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 27.11.2023.
//

import Foundation

class MainViewModel {
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        10
    }
    
    func getUsers() {
        NetworkDataFetch.shared.fetchPosts {posts, error in
            if error != nil {
                print("error")
            } else if let posts{
                print(posts.posts.count)
            }
        }
    }
}
