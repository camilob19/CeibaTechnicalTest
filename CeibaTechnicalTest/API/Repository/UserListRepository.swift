//
//  UserListRepository.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 14/01/23.
//

import Alamofire
import Combine
import Foundation


protocol UserListRepositoryProtocol {
    func getUsers() -> AnyPublisher<[UserResponse], NetworkError>
    func getUserposts(by id: Int) -> AnyPublisher<[UserIdResponse], NetworkError>
}

final class UserListRepository: UserListRepositoryProtocol {
    
    let userApi: UserInformationAPIProtocol
    
    init(userApi: UserInformationAPIProtocol = UserInformationAPI()) {
        self.userApi = userApi
    }
    
    func getUsers() -> AnyPublisher<[UserResponse], NetworkError> {
        return userApi.getUsers()
    }
    
    func getUserposts(by id: Int) -> AnyPublisher<[UserIdResponse], NetworkError> {
        return userApi.getUserPosts(by: id)
    }
}
