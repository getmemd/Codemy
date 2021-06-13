//
//  Account.swift
//  CodemyProject
//
//  Created by Адиль Медеуев on 13.06.2021.
//

import Foundation
import Moya

final class Account: ObservableObject {
    @Published var user: User?
    @Published var isAuthed = false
    
    private let userService = MoyaProvider<UserService>()
    
    func register(user: User) {
        userService.request(.createUser(user: user)) { result in
            switch result {
            case let .success(response):
                print(response)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func login(username: String) {
//        userService.
    }
}
