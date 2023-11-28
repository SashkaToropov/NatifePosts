//
//  UILabel + Extensions.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 28.11.2023.
//

import UIKit

extension UILabel {
    var maxNumberOfLines: Int {
        guard let text = self.text, let font = self.font else {
            return 0
        }
        
        let size = CGSize(width: frame.size.width, height: .greatestFiniteMagnitude)
        let options = NSStringDrawingOptions.usesLineFragmentOrigin
        let attributes = [NSAttributedString.Key.font: font]
        let textHeight = text.boundingRect(with: size, options: options, attributes: attributes, context: nil).height
        let lineHeight = font.lineHeight
        
        return Int(ceil(textHeight / lineHeight))
    }
}
