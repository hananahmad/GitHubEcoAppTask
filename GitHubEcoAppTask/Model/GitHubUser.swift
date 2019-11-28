//
//  GitHubUser.swift
//  GitHubEcoAppTask
//
//  Created by Hanan on 11/28/19.
//  Copyright © 2019 HANAN. All rights reserved.
//

import Foundation

struct GitHubUser: Codable {
 
    let login: String?
    let id: Int?
    let avatarUrl: String?
    let gravatar_id: String?
    let repos: String?
    let githubUrl: String?
    let html_url: String?
    let accountType: String?
    let siteAdminStatus: Bool?
    var isFavorite:Bool = false

    private enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatarUrl = "avatar_url"
        case gravatar_id
        case repos = "repos_url"
        case githubUrl = "url"
        case html_url
        case accountType = "type"
        case siteAdminStatus = "site_admin"
//        case isFavorite
    }
    
//    init(from decoder: Decoder) throws{
//           let container = try decoder.container(keyedBy: CodingKeys.self)
//        gravatar_id = try container.decode(String.self, forKey: .gravatar_id)
//
//        repos = try container.decode(String.self, forKey: .repos)
//        githubUrl = try container.decode(String.self, forKey: .githubUrl)
//        html_url = try container.decode(String.self, forKey: .html_url)
//        accountType = try container.decode(String.self, forKey: .accountType)
//        siteAdminStatus = try container.decode(Bool.self, forKey: .siteAdminStatus)
//
//               isFavorite = (try container.decodeIfPresent(Bool.self, forKey: .isFavorite)) ?? false
//       }
}

//"login": "cheapRoc",
//"id": 140,
//"avatar_url": "https://avatars2.githubusercontent.com/u/140?v=4",
//"gravatar_id": "",
//"url": "https://api.github.com/users/cheapRoc",
//"html_url": "https://github.com/cheapRoc",
//"followers_url": "https://api.github.com/users/cheapRoc/followers",
//"following_url": "https://api.github.com/users/cheapRoc/following{/other_user}",
//"gists_url": "https://api.github.com/users/cheapRoc/gists{/gist_id}",
//"starred_url": "https://api.github.com/users/cheapRoc/starred{/owner}{/repo}",
//"subscriptions_url": "https://api.github.com/users/cheapRoc/subscriptions",
//"organizations_url": "https://api.github.com/users/cheapRoc/orgs",
//"repos_url": "https://api.github.com/users/cheapRoc/repos",
//"events_url": "https://api.github.com/users/cheapRoc/events{/privacy}",
//"received_events_url": "https://api.github.com/users/cheapRoc/received_events",
//"type": "User",
//"site_admin": false
