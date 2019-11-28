//
//  GitHubUserTableViewCell.swift
//  GitHubEcoAppTask
//
//  Created by Hanan on 11/28/19.
//  Copyright © 2019 HANAN. All rights reserved.
//

import UIKit
import Kingfisher

class GitHubUserTableViewCell: UITableViewCell {
    
    //==================================
    // MARK: - IBOutlets
    //==================================
    @IBOutlet weak var userAvatarImageView: UIImageView! {
        didSet {
            userAvatarImageView.layer.cornerRadius = userAvatarImageView.frame.size.width/2
            
        }
    }
    @IBOutlet weak var repoNameLbl: UILabel!
    @IBOutlet weak var githubUrlBtn: UIButton!
    @IBOutlet weak var favoriteBtn: UIButton!
    @IBOutlet weak var accountTypeLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    
    //==================================
    // MARK: - Variables
    //==================================
    var tapOnGitURL: ((GitHubUserTableViewCell) -> Void)?
    var tapOnFavorite: ((GitHubUserTableViewCell) -> Void)?
    
    //==================================
    // MARK: - Cell LifeCycle
    //==================================
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.bringSubviewToFront(favoriteBtn)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

//==================================
// MARK: - Cell Setup
//==================================
extension GitHubUserTableViewCell {
    func setUpCell(withGitHubInfo gitHub: GitHubUser) {
        repoNameLbl.text = gitHub.login?.capitalized ?? ""
        githubUrlBtn.setTitle(gitHub.html_url ?? "", for: .normal)
        favoriteBtn?.tintColor = gitHub.isFavorite ? .blue : .lightGray
        userAvatarImageView.setImage(with: URL(string: gitHub.avatarUrl ?? ""), placeholder: UIImage(systemName: "person"))
        
        accountTypeLbl.text = "Account Type:\(gitHub.accountType ?? "")"
        statusLbl.text = "Status: \(gitHub.siteAdminStatus?.description ?? "")"
    }
}

//==================================
// MARK: - IBActions
//==================================
extension GitHubUserTableViewCell {
    @IBAction func tapOnUserGitURL(_ sender: Any) {
        tapOnGitURL?(self)
    }
    
    @IBAction func tapOnUserFavorite(_ sender: Any) {
        tapOnFavorite?(self)
    }
}
