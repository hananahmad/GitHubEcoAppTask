//
//  ViewController.swift
//  GitHubEcoAppTask
//
//  Created by Hanan on 11/28/19.
//  Copyright © 2019 HANAN. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    //==================================
    // MARK: - Outlets
    //==================================
    @IBOutlet weak var gitUsersTableView: UITableView!
    @IBOutlet weak var noDataView: UILabel!
    
    //==================================
    // MARK: - Variables
    //==================================
    var presenter : ViewControllerPresenter?
    var selectedUser: GitHubUser?
    
    //==================================
    // MARK: - ViewLifeCycle
    //==================================
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        setupRelations()
        fetchGitHubUsersList()
    }
    
}

//==================================
// MARK: - Helping Functions
//==================================
extension ViewController {
    
    func setupTableView() {
        registerCustomCells()
        gitUsersTableView.tableFooterView = UIView()
    }
    
    func registerCustomCells() {
        gitUsersTableView?.register(GitHubUserTableViewCell.nib, forCellReuseIdentifier: GitHubUserTableViewCell.identifier)
    }
    
    func setupRelations() {
        presenter = ViewControllerPresenter()
        presenter?.delegate = self
    }
    
    func fetchGitHubUsersList() {
        presenter?.fetchGitHubUsers()
    }
    
    func loadInitialData() {
        showNoDataView(false)
    }
    
    func showNoDataView(_ state: Bool?) {
        noDataView.isHidden = !(state ?? true)
        gitUsersTableView.reloadData()
    }
}

//==================================
// MARK: - UITableViewDelegate
//==================================
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if let count = self.presenter?.gitUsersDataSource.count, count > 0 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = self.presenter?.gitUsersDataSource.count, count > 0 {
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GitHubUserTableViewCell.identifier, for: indexPath) as? GitHubUserTableViewCell
        
        // Populate data
        if let gitUsers = self.presenter?.gitUsersDataSource, gitUsers.count > 0 {
            cell?.setUpCell(withGitHubInfo: gitUsers[indexPath.row])
        }
        
        cell?.tapOnGitURL = { [weak self](cell)  in
            self?.selectedUser = self?.presenter?.gitUsersDataSource[indexPath.row]
            self?.performSegue(withIdentifier: "gitDetailIdentifier", sender: self)
        }
        
        cell?.tapOnFavorite = { [weak self](cell)  in
            let isFavorited = self?.presenter?.gitUsersDataSource[indexPath.row].isFavorite
            self?.presenter?.gitUsersDataSource[indexPath.row].isFavorite = !(isFavorited ?? false)
            self?.gitUsersTableView.reloadData()
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

//==================================
// MARK: - View - Presenter Delegate
//==================================
extension ViewController : ViewControllerDelegate {
    func usersFetched() {
        loadInitialData()
    }
    
    func showNoDataState() {
        showNoDataView(true)
    }
    
    func showActivity(_ state: Bool) {
        showActivityIndicator(state)
    }
    
    func showError(_ withMessage: String) { showSystemAlert(withMessage: withMessage) }
}


//==================================
// MARK: - Navigations
//==================================
extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "gitDetailIdentifier") {
            // pass data to next view
            if let gitHubDetailViewController = segue.destination as? GitHubDetailViewController {
                gitHubDetailViewController.selectedUser = self.selectedUser
            }
        }
    }
}
