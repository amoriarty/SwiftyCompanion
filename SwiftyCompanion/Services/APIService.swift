//
//  APIService.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 17/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import Foundation
import ToolboxLGNT

class APIService {
    private let apiurl = "https://api.intra.42.fr"
    private var auth: Auth?
    static let shared = APIService()
    
    func getToken() {
        guard let url = URL(string: "\(apiurl)/oauth/token") else { return }
        var request = URLRequest(url: url)
        var body = "grant_type=client_credentials"
        body += "&client_id=\(API_UID)"
        body += "&client_secret=\(API_SECRET)"
        
        request.httpMethod = "POST"
        request.httpBody = body.data(using: .utf8)
        
        DataService.shared.get(request: request, for: Auth.self) { auth in
            self.auth = auth
        }
    }
    
    func getUser(_ login: String, completion: @escaping (User?) -> Void) {
        guard let token = auth?.token else { return }
        guard let url = URL(string: "\(apiurl)/v2/users/\(login)") else { return }
        var request = URLRequest(url: url)
        
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        DataService.shared.get(request: request, for: User.self, completion: completion)
    }
}
