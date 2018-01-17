//
//  Auth.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 17/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import Foundation

struct Auth: Decodable {
    let token: String
    
    private enum CodingKeys: CodingKey, String {
        case token = "access_token"
    }
}
