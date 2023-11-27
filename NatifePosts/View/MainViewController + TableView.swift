//
//  MainViewController + TableView.swift
//  NatifePosts
//
//  Created by  Toropov Oleksandr on 27.11.2023.
//

import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        registerCell()
    }
    
    func registerCell() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}
