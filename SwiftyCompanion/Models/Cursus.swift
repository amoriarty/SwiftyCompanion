//
//  Cursus.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 17/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import Foundation

struct Cursus: Decodable {
    let id: Int
    let name: String
    let slug: String
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
