//
//  MainViewModel.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 27.11.2023.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MainCellViewModel]> = Observable([])
    var dataSource: Posts?
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        dataSource?.posts.count ?? 0
    }
    
    func getUsers() {
        isLoading.value = true
        
        NetworkDataFetch.shared.fetchPosts { [weak self] posts, _ in
            guard let self else { return }
            self.isLoading.value = false
            if let posts {
                self.dataSource = posts
                mapCellData()
            }
        }
    }
    
    func mapCellData() {
        cellDataSource.value = dataSource?.posts.compactMap{ MainCellViewModel($0) }
    }
}
