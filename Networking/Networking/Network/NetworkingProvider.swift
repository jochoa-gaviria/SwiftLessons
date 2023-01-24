//
//  NetworkingProvider.swift
//  Networking
//
//  Created by Juan on 22/1/23.
//

import Foundation
import Alamofire

final class NetworkingProvider {
    static let shared = NetworkingProvider()
    
    private let kBaseUrl = "https://gorest.co.in/public/v2/"
    private let kStatusOk = 200...299
    private let kToken = "f38243727fd870cd50d42b3e2ad3eaa7bbb659c3510298207bec5cd1c909f2c7"
    
    func getUser(id: Int, success: @escaping (_ user: User) -> (), failure: @escaping (_ error: Error?) -> ()){
        let url = "\(kBaseUrl)users/\(id)"
        AF.request(url, method: .get).validate(statusCode: kStatusOk).responseDecodable(of: User.self) {
            response in
            if let user = response.value {
                success(user)
            } else {
                failure(response.error)
            }
        }
    }
    
    func addUser(user: NewUser, success: @escaping (_ user: User) -> (), failure: @escaping (_ error: Error?) -> ()){
        let url = "\(kBaseUrl)users"
        
        let headers: HTTPHeaders = [.authorization(bearerToken: kToken)]
        
        AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: kStatusOk).responseDecodable(of: User.self) {
            response in
            if let user = response.value, user.id != nil {
                success(user)
            } else {
                failure(response.error)
            }
        }
    }
    
    
    func updateUser(id:Int, user: NewUser, success: @escaping (_ user: User) -> (), failure: @escaping (_ error: Error?) -> ()){
        let url = "\(kBaseUrl)users/\(id)"
        
        let headers: HTTPHeaders = [.authorization(bearerToken: kToken)]
        
        AF.request(url, method: .put, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: kStatusOk).responseDecodable(of: User.self) {
            response in
            if let user = response.value, user.id != nil {
                success(user)
            } else {
                failure(response.error)
            }
        }
    }
    
    func deleteUser(id:Int, success: @escaping () -> (), failure: @escaping (_ error: Error?) -> ()){
        let url = "\(kBaseUrl)users/\(id)"
        
        let headers: HTTPHeaders = [.authorization(bearerToken: kToken)]
        
        AF.request(url, method: .delete, headers: headers).validate(statusCode: kStatusOk).response { response in
            if let error = response.error {
                failure(error)
            }else {
                success()
            }
        }
    }
}
