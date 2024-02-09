//
//  DetailViewModel.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 29.11.2023.
//

import Foundation

final class DetailsViewModel {
    
    let id: Int
    let title: String
    let textContent: String
    let likesCount: Int
    let imageURL: URL?
    
    init(_ post: DetailPost) {
        self.id = post.postID
        self.title = post.title
        self.textContent = post.text
        self.likesCount = post.likesCount
        self.imageURL = URL(string: post.postImage)
    }   
}
