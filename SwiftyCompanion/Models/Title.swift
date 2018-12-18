//
//  Title.swift
//  SwiftyCompanion
//
//  Created by Alex Legent on 17/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import Foundation

struct Title: Decodable {
    let id: Int
    let name: String
}

struct TitleUser: Decodable {
    let id: Int
    let userId: Int
    let titleId: Int
    let selected: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, selected
        case userId = "user_id"
        case titleId = "title_id"
    }
}
