//
//  DateFormatter + Extensions.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 29.11.2023.
//

import Foundation

extension DateFormatter {
        static let customFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "d MMMM YYYY"
            return formatter
        }()
}
