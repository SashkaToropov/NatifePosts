//
//  DetailPost.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 09.02.2024.
//

import Foundation

// MARK: - DetailPost
struct DetailPosts: Codable {
    let post: DetailPost
}

// MARK: - Post
struct DetailPost: Codable {
    let postID: Int
    let title, text: String
    let postImage: String
    let likesCount: Int

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case title, text, postImage
        case likesCount = "likes_count"
    }
}
