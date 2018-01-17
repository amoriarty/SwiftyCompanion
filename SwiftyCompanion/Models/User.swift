//
//  User.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 17/01/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import Foundation

struct User: Decodable {
    let id: Int
    let login: String
    let email: String
    let phone: String?
    let displayName: String
    let location: String?
    let wallet: Int
    let correctionPoint: Int
    let imageUrl: String
    let titles: [Title]
    let titlesUser: [TitleUser]
    let campus: [Campus]
    let campusUser: [CampusUser]
    let cursusUser: [CursusUser]
    
    private enum CodingKeys: CodingKey, String {
        case id, login, email, phone, location, wallet, titles, campus
        case displayName = "displayname"
        case correctionPoint = "correction_point"
        case imageUrl = "image_url"
        case titlesUser = "titles_users"
        case campusUser = "campus_users"
        case cursusUser = "cursus_users"
    }
}