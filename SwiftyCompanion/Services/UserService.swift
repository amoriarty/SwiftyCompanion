//
//  UserService.swift
//  SwiftyCompanion
//
//  Created by Émilie Legent on 07/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import Foundation

protocol UserServiceDelegate {
    func userDidChange()
}

class UserService {
    static let shared = UserService()
    private var cursus = Cursus(id: 1, name: "42", slug: "42")
    private var delegates = [UserServiceDelegate]()
    
    var user: User? {
        didSet {
            cursus = Cursus(id: 1, name: "42", slug: "42")
            delegates.forEach { $0.userDidChange() }
        }
    }
    
    func add(delegate: UserServiceDelegate) {
        delegates.append(delegate)
    }
    
    func getCursusUser() -> CursusUser? {
        if let cursus = user?.cursusUser.first(where: { $0.cursus == cursus }) {
            return cursus
        }
        return user?.cursusUser.first
    }
}
