//
//  DetailViewController.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 29.11.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "e-Ukraine-Bold", size: 30)
        label.numberOfLines = 0
        label.contentMode = .topLeft
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let previewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "e-Ukraine-Regular", size: 20)
        label.textColor = .gray
        label.numberOfLines = 0
        label.contentMode = .topLeft
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "e-Ukraine-Light", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "e-Ukraine-Light", size: 16)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bell")
        return imageView
    }()

    private lazy var likesAndDateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likesLabel, dateLabel])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel, previewLabel, likesAndDateStackView])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let detailsViewModel: DetailsViewModel
    
    // MARK: - Initialization
    
    init(detailsViewModel: DetailsViewModel) {
        self.detailsViewModel = detailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstrains()
        displayPostInfo()
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        title = "Detail"
        view.backgroundColor = .systemBackground
        
        view.addSubview(labelsStackView)
    }
    
    // MARK: - Data Display
        
    private func displayPostInfo() {
        titleLabel.text = detailsViewModel.title
        previewLabel.text = detailsViewModel.textContent
        likesLabel.text = "❤️ \(detailsViewModel.likesCount)"
        dateLabel.text = detailsViewModel.date.formatted()
    }
}

// MARK: - Constraints

private extension DetailViewController {
    
    private func setConstrains() {
        NSLayoutConstraint.activate([
                labelsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
                labelsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
                labelsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
                labelsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),

                likesAndDateStackView.leadingAnchor.constraint(equalTo: labelsStackView.leadingAnchor, constant: 8),
                likesAndDateStackView.trailingAnchor.constraint(equalTo: labelsStackView.trailingAnchor, constant: -8),
                likesAndDateStackView.bottomAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: -8),

                dateLabel.widthAnchor.constraint(equalToConstant: 150),
                
                imageView.heightAnchor.constraint(equalToConstant: 200),
                
                titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
                
                previewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
                previewLabel.bottomAnchor.constraint(equalTo: likesAndDateStackView.topAnchor, constant: -200)
        ])
    }
}
