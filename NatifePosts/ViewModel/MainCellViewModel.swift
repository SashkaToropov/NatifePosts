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
    
    init(_ user: Post) {
        self.postID = user.postID
        self.title = user.title
        self.previewText = user.previewText
        self.likesCount = user.likesCount
        self.timeStamp = user.timeStamp
    }
    
}
