//
//  Campus.swift
//  SwiftyCompanion
//
//  Created by Alex Legent on 17/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import Foundation

struct Campus: Decodable {
    let id: Int
    let name: String
}

struct CampusUser: Decodable {
    let id: Int
    let userId: Int
    let campusId: Int
    let isPrimary: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case campusId = "campus_id"
        case isPrimary = "is_primary"
    }
}
