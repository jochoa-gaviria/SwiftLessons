//
//  User.swift
//  Networking
//
//  Created by Juan on 22/1/23.
//

import Foundation


struct UserResponse: Decodable {
    let code: Int?
    let data: User?
}


struct User: Decodable {
    let id: Int?
    let fullName: String?
    let email: String?
    let gender: String?
    let status: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "name" //It's use to map "name" for the json into the fullName property.
        case gender
        case status
        case email
    }
}
