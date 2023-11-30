//
//  DetailViewModel.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 29.11.2023.
//

import Foundation

final class DetailsViewModel {
    let title: String
    let textContent: String
    let likesCount: Int
    let date: Date
    
    init(_ post: Post) {
        self.title = post.title
        self.textContent = post.previewText
        self.likesCount = post.likesCount
        self.date = post.date
    }
}
