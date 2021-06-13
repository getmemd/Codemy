//
//  UserService.swift
//  CodemyProject
//
//  Created by Адиль Медеуев on 07.06.2021.
//

import Foundation
import Moya

enum UserService {
    case getUser(id: Int)
    case login(email: String, username: String, password: String)
    case createUser(user: User)
    case updateUser(id: Int, name: String)
}

extension UserService: TargetType {
    var baseURL: URL {
        return URL(string: "http://codemy.xyz/users/")!
    }
    
    var path: String {
        switch self {
        case let .getUser(id):
            return "user/\(id)"
        case .login:
            return "login/"
        case .createUser:
            return "register_user/"
        case let .updateUser(id, name):
            return "update_user/\(id)/\(name)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUser, .login:
            return .get
        case .createUser, .updateUser:
            return .post
        }
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case .getUser:
            return .requestPlain
        case let .login(email, username, password):
            return .requestParameters(parameters: [
                "email": email,
                "username": username,
                "password": password
            ], encoding: JSONEncoding.default)
        case let .createUser(user):
            return .requestParameters(parameters: ["user":
                                                    [
                                                        "first_name": user.firstName,
                                                        "last_name": user.lastName,
                                                        "email": user.email,
                                                        "username": user.username,
                                                        "password": user.password,
                                                        "fathersname": user.fathersname,
                                                        "avatar": user.avatar!.path]
                                                  ], encoding: JSONEncoding.default)
        case .updateUser:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        nil
    }
}
