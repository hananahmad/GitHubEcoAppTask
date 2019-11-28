//
//  ViewControllerPresenter.swift
//  GitHubEcoAppTask
//
//  Created by Hanan on 11/28/19.
//  Copyright © 2019 HANAN. All rights reserved.
//

import Foundation

//==================================
// MARK: - View - Presenter Delegate
//==================================
protocol ViewControllerDelegate : class {
    func usersFetched()
    func showNoDataState()
    func showActivity(_ state: Bool)
    func showError(_ withMessage: String)
}

//==================================
// MARK: - Data Presenter
//==================================
class ViewControllerPresenter {
    
    //==================================
    // MARK: - Delegate Reference
    //==================================
    weak var delegate : ViewControllerDelegate?
    
    //==================================
    // MARK: - Variables
    //==================================
    var gitUsersDataSource  = [GitHubUser]()
    
    //==================================
    // MARK: - Init / De-Init
    //==================================
    init() { }
    
    deinit { delegate = nil }
}

//==================================
// MARK: - Networking Calls
//==================================
extension ViewControllerPresenter {
    func fetchGitHubUsers() {
        if  APIClient.sharedInstance.reachability?.connection == .wifi || APIClient.sharedInstance.reachability?.connection == .cellular {
            delegate?.showActivity(true)
            APIClient.sharedInstance.getUserLists {
                [weak self] (Result) in
                self?.delegate?.showActivity(false)
                switch Result {

                case .success(let value):
                    if let gitUsers = value as? [GitHubUser] {
                        self?.gitUsersDataSource = gitUsers
                        self?.delegate?.usersFetched()
                    }
                case .failure(let error):
                    self?.delegate?.showError(error.localizedDescription)
                }
            }
        } else { delegate?.showError("NO_INTERNET_AGAIN") }
    }
}
