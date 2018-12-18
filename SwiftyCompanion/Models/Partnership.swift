//
//  Partnership.swift
//  SwiftyCompanion
//
//  Created by Alex Legent on 02/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import Foundation

struct Partnership: Decodable {
    let id: Int
    let name: String
    let slug: String
    let tier: Int
}
