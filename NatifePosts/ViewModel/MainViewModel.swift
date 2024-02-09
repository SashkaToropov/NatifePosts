//
//  MainViewModel.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 27.11.2023.
//

import Foundation

final class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MainCellViewModel]> = Observable([])
    var dataSource: Posts?
    
    var detailDataSource: Observable<DetailsViewModel> = Observable(nil)
    var dataSource1: DetailPosts?
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        dataSource?.posts.count ?? 0
    }
    
    func getPosts() {
        isLoading.value = true
                
        NetworkDataFetch.shared.fetchPosts { [weak self] posts, _ in
            guard let self else { return }
            self.isLoading.value = false
            if let posts {
                self.dataSource = posts
                self.mapCellData()
            }
        }
    }
    
    func mapCellData() {
        cellDataSource.value = dataSource?.posts.compactMap{ MainCellViewModel($0) }
    }
    
    func getDetailPost(for id: Int, completion: @escaping () -> Void) {
        NetworkDataFetch.shared.fetchDetailPost(for: id) { [weak self] detailPost, _ in
            guard let self = self else {
                print(#function)
                return
            }
            if let detailPost {
                self.dataSource1 = detailPost
                self.mapDetailData()
                completion()
            }
        }
    }
    
    func mapDetailData() {
        guard let detailPost = dataSource1?.post else { print(#function)
            return }
        detailDataSource.value = DetailsViewModel(detailPost)
    }
}
