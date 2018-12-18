//
//  Auth.swift
//  SwiftyCompanion
//
//  Created by Alex Legent on 17/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import Foundation

struct Auth: Decodable {
    let token: String
    
    private enum CodingKeys: String, CodingKey {
        case token = "access_token"
    }
}
