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
        tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.cellIdentifier)
    }
    
    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.cellIdentifier,
                                                       for: indexPath) as? MainCell else {
              return UITableViewCell()
          }
        
        let cellViewModel = cellDataSource[indexPath.row]
        cell.setupCell(viewModel: cellViewModel)
        return cell
    }
}
