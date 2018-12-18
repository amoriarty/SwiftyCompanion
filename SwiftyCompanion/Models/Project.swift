//
//  Project.swift
//  SwiftyCompanion
//
//  Created by Alex Legent on 02/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import Foundation

struct Project: Decodable {
    let id: Int
    let name: String
    let slug: String
    let parent: Int?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, slug
        case parent = "parent_id"
    }
}

struct ProjectUser: Decodable {
    let mark: Int?
    let status: String
    let validated: Bool?
    let project: Project
    
    private enum CodingKeys: String, CodingKey {
        case status, project
        case mark = "final_mark"
        case validated = "validated?"
    }
}
