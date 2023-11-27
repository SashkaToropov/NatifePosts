//
//  MainViewController + TableView.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 27.11.2023.
//

import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table View Setup
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        registerCell()
    }
    
    // MARK: - Table View Reloading
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Cell Registration
    
    func registerCell() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}
