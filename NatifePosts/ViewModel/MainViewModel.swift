//
//  MainViewModel.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 27.11.2023.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var dataSource: Posts?
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        10
    }
    
    func getUsers() {
        isLoading.value = true
        
        NetworkDataFetch.shared.fetchPosts { [weak self] posts, _ in
            guard let self else { return }
            self.isLoading.value = false
            if let posts {
                self.dataSource = posts
            }
        }
    }
}
