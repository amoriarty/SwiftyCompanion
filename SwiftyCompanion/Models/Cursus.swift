//
//  Cursus.swift
//  SwiftyCompanion
//
//  Created by Alex Legent on 17/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import Foundation

struct Cursus: Decodable {
    let id: Int
    let name: String
    let slug: String
    
    static func ==(left: Cursus, right: Cursus) -> Bool {
        return left.id == right.id
    }
}



struct Skill: Decodable {
    let id: Int
    let name: String
    let level: Double
    let ratio: Double?
}

struct CursusUser: Decodable {
    let id: Int
    let grade: String?
    let level: Double
    let skills: [Skill]
    let cursus: Cursus
}
