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
        
        cell.didExpandButtonPressed = {
            if cell.previewLabel.numberOfLines == 0 {
                self.expandedPosts.append(cellViewModel.postID)
            } else {
                self.expandedPosts.removeAll { $0 == cellViewModel.postID }
            }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        let lines = cell.previewLabel.maxNumberOfLines
        cell.expandButton.isHidden = false
        if expandedPosts.contains(cellViewModel.postID) {
            cell.previewLabel.numberOfLines = 0
            tableView.reloadRows(at: [indexPath], with: .automatic)
        } else if lines > 2 {
            cell.previewLabel.numberOfLines = 2
            cell.expandButton.setTitle("Expand", for: .normal)
        } else {
            cell.expandButton.isHidden = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let selectedPostId = viewModel.dataSource?.posts[indexPath.row].postID else {
            print(#function)
            return
        }
        
        viewModel.getDetailPost(for: selectedPostId) { [weak self] in
            guard let post = self?.viewModel.dataSource1?.post else {
                print(#function)
                return
            }
            self?.presentDetailsViewController(post: post)
        }

        print(selectedPostId)
    }
}
