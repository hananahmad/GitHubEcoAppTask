//
//  GitHubDetailViewController.swift
//  GitHubEcoAppTask
//
//  Created by Hanan on 11/28/19.
//  Copyright © 2019 HANAN. All rights reserved.
//

import UIKit
import WebKit

class GitHubDetailViewController: UIViewController {

    //==================================
    // MARK: - Outlets
    //==================================
    @IBOutlet weak var webView: WKWebView!
    
    //==================================
    // MARK: - Variables
    //==================================
    var selectedUser: GitHubUser?

    //==================================
    // MARK: - ViewLifeCycle
    //==================================
    override func viewDidLoad() {
        super.viewDidLoad()
//        webView.navigationDelegate = self
        if let selectedUserProfile = selectedUser?.html_url {
            let url = URL(string: selectedUserProfile)!
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
        }
    }
}

//extension GitHubDetailViewController : WKNavigationDelegate {
//
//}
