//
//  DetailViewController.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 29.11.2023.
//

import UIKit
import SDWebImage

final class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "e-Ukraine-Bold", size: 20)
        label.numberOfLines = 0
        label.contentMode = .topLeft
        return label
    }()
    
    let previewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "e-Ukraine-Regular", size: 14)
        label.textColor = .gray
        label.numberOfLines = 0
        label.contentMode = .topLeft
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "e-Ukraine-Light", size: 12)
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let detailsViewModel: DetailsViewModel
    
    // MARK: - Initialization
    
    init(detailsViewModel: DetailsViewModel) {
        self.detailsViewModel = detailsViewModel
        super.init(nibName: nil, bundle: nil)
        self.view.isUserInteractionEnabled = true
        
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
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
    }
    
    // MARK: - Data Display
    
    private func displayPostInfo() {
        titleLabel.text = detailsViewModel.title
        previewLabel.text = detailsViewModel.textContent
        likesLabel.text = "❤️ \(detailsViewModel.likesCount)"
        imageView.sd_setImage(with: detailsViewModel.imageURL)
    }
}

// MARK: - Constraints

private extension DetailViewController {
    
    private func setConstrains() {
        [scrollView, contentView, titleLabel, previewLabel, imageView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(previewLabel)
        
        let hConst = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)

        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 1000),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -10),
            contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -20),
            
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo:imageView.widthAnchor, multiplier: 0.75),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        
            previewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            previewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            previewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
