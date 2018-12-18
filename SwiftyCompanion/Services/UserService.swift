//
//  UserService.swift
//  SwiftyCompanion
//
//  Created by Alex Legent on 07/02/2018.
//  Copyright © 2018 Alexandre Legent. All rights reserved.
//

import Foundation

protocol UserServiceDelegate {
    func userDidChange()
}

class UserService {
    static let shared = UserService()
    private var delegates = [UserServiceDelegate]()
    var cursus = Cursus(id: 1, name: "42", slug: "42") {
        didSet { delegates.forEach { $0.userDidChange() } }
    }
    
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
