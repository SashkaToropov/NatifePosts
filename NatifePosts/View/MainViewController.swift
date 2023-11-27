//
//  ViewController.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 20.11.2023.
//

import UIKit

class MainViewController: UIViewController {
    
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
    
    var viewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        viewModel.getUsers()
    }
    
    private func setupViews() {
        view.backgroundColor = .white

        view.addSubview(tableView)
        setupTableView()
    }
}

extension MainViewController {
    
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
