//
//  MainCellViewModel.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 27.11.2023.
//

import Foundation

class MainCellViewModel {
    
    var postID: Int
    var title: String
    var previewText: String
    var likesCount: Int
    var timeStamp: Int
    var date: Date
    
    init(_ post: Post) {
        self.postID = post.postID
        self.title = post.title
        self.previewText = post.previewText
        self.likesCount = post.likesCount
        self.timeStamp = post.timeStamp
        self.date = post.date
    }
    
}
