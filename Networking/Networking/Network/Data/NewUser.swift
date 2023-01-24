//
//  NewUser.swift
//  Networking
//
//  Created by Juan on 23/1/23.
//

import Foundation

struct NewUser : Encodable {
    let name: String?
    let email: String?
    let gender: String?
    let status: String?
}
