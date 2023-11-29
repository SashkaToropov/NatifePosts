//
//  Date + Extensions.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 27.11.2023.
//

import Foundation

extension Date {
    func timeAgo() -> String {
            return RelativeDateTimeFormatter
                .customFormat
                .localizedString(for: self, relativeTo: Date())
    }
    
    func formatted() -> String {
        return DateFormatter
            .customFormat
            .string(from: self)
    }
}
