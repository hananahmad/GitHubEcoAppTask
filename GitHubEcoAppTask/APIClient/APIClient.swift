//
//  APIClient.swift
//  GitHubEcoAppTask
//
//  Created by Hanan on 11/28/19.
//  Copyright © 2019 HANAN. All rights reserved.
//

import Foundation
import Alamofire
import Reachability

final class APIClient {
    
    //MARK :- Shared Instance
    static let sharedInstance: APIClient = APIClient()
    
    let reachability = try? Reachability()
    
    private init() {
        networkReachability()
    }
    
    //MARK:-NetworkReachability
    func networkReachability() {
        reachability?.whenReachable = { reachability in
            DispatchQueue.main.async {
                if reachability.connection == .wifi {
                    
                } else {
                }
            }
        }
        reachability?.whenUnreachable = { reachability in
            DispatchQueue.main.async {
            }
        }
        
        do {
            try reachability?.startNotifier()
        } catch {
        }
    }
    
    // Get Users List
    func getUserLists(completionHandler:  @escaping (Result<Any, Error>) -> Void) {
        
        let strURL = Constants.Endpoints.getGitUsers
        
        AF.request(strURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate()
            .responseJSON { response in
                
                guard let data = response.data else { return }
                
                do {
                    let decoder = JSONDecoder()

                    let users = try decoder.decode([GitHubUser].self, from: data)
                    completionHandler(.success(users))
                } catch let error {
                    print(error)
                    completionHandler(.failure(error))
                }
        }
    }
}



