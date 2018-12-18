//
//  Achievement.swift
//  SwiftyCompanion
//
//  Created by Alex Legent on 01/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import Foundation

struct Achievement: Decodable {
    let id: Int
    let name: String
    let description: String
    let image: String
}
