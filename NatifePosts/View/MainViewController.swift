//
//  ViewController.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 20.11.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    private let sortButton: UIBarButtonItem = {
        let sortButton = UIBarButtonItem()
        sortButton.image = UIImage(systemName: "arrow.up.arrow.down")
        sortButton.style = .plain
        return sortButton
    }()
    
    var viewModel = MainViewModel()
    
    var cellDataSource = [MainCellViewModel]()
    
    var expandedPosts = [Int]()

    
    // MARK: - Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getPosts()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        bindViewModel()
        setupNavigationBar()
    }
    
    // MARK: - Setup Methods
    
    private func setupViews() {
        view.backgroundColor = .systemBackground

        view.addSubview(tableView)
        setupTableView()
        
        view.addSubview(activityIndicator)
    }
    
    private func setupNavigationBar() {
        title = "Natife Posts"
        
        let sortByDateAction = UIAction(title: "Date Posted") { _ in
            self.sortPostsBy(.datePosted)
        }
        let sortByLikesAction = UIAction(title: "Likes") { _ in
            self.sortPostsBy(.likes)
        }
        
        sortButton.menu = UIMenu(
            title: "Sort By",
            children: [sortByDateAction, sortByLikesAction]
        )
        navigationItem.rightBarButtonItem = sortButton
    }
    
    // MARK: - Sorting
    
    private func sortPostsBy(_ sortOrder: SortOrder) {
        switch sortOrder {
        case .datePosted:
            cellDataSource.sort { $0.timeStamp > $1.timeStamp }
        case .likes:
            cellDataSource.sort { $0.likesCount > $1.likesCount }
        }
        reloadTableView()
    }
    
    // MARK: - Navigation
    
    func presentDetailsViewController(post: Post) {
        let detailsViewModel = DetailsViewModel(post)
        let detailsViewController = DetailViewController(detailsViewModel: detailsViewModel)
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    // MARK: - Data Binding
    
    private func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self, let isLoading else { return }
            DispatchQueue.main.async {
                isLoading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] posts in
            guard let self = self, let posts = posts else { return }
            self.cellDataSource = posts
            self.reloadTableView()
        }
    }
}

// MARK: - Extensions

private extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
