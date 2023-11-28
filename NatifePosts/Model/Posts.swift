//
//  Posts.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 27.11.2023.
//

import Foundation

// MARK: - Posts

struct Posts: Codable {
    var posts: [Post]
}

// MARK: - Post

struct Post: Codable {
    let postID, timeStamp: Int
    let title, previewText: String
    let likesCount: Int

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case timeStamp = "timeshamp"
        case title
        case previewText = "preview_text"
        case likesCount = "likes_count"
    }
}

// MARK: - Extensions

extension Post {
    var date: Date {
            Date(timeIntervalSince1970: TimeInterval(timeStamp))
    }
}

