//
//  MainCell.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 27.11.2023.
//

import Foundation
import UIKit

class MainCell: UITableViewCell {
    
    static var cellIdentifier: String {
        return String(describing: MainCell.self)
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    let previewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }()
    private let likesLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let expandButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var likesAndDateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likesLabel, dateLabel])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, previewLabel, likesAndDateStackView, expandButton])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            likesAndDateStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8),
            likesAndDateStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -8),
            
            dateLabel.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func setupCell(viewModel: MainCellViewModel) {
        titleLabel.text = viewModel.title
        previewLabel.text = viewModel.previewText
        likesLabel.text = "❤️ \(viewModel.likesCount)"
        dateLabel.text = "\(viewModel.timeStamp)"
    }
}
