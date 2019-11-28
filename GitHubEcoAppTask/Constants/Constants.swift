//
//  Constants.swift
//  GitHubEcoAppTask
//
//  Created by Hanan on 11/28/19.
//  Copyright © 2019 HANAN. All rights reserved.
//

import Foundation

struct Constants {
    
    private struct DomainUrl {
        
        static let UATStaging    = "https://api.github.com/"
        
        static let UAT = UATStaging
    }
    
    private static let domain = DomainUrl.UAT
    
    struct Endpoints {
        
        // Get Git Users API
        static let getGitUsers = domain + "users"
    }
}
