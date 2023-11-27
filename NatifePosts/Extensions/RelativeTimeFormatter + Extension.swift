//
//  RelativeTimeFormatter + Extension.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 27.11.2023.
//

import Foundation

extension RelativeDateTimeFormatter {
    
    static let customFormat: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        
        formatter.unitsStyle = .full
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()

}
