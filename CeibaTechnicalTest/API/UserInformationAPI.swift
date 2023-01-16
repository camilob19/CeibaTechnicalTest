//
//  UserInformationAPI.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 14/01/23.
//

import Alamofire
import Combine
import Foundation

protocol UserInformationAPIProtocol {
    func getUsers() -> AnyPublisher<[UserResponse], NetworkError>
    func getUserPosts(by id: Int) -> AnyPublisher<[UserIdResponse], NetworkError>
}

final class UserInformationAPI: UserInformationAPIProtocol {
    
    let httpClient: HTTPClientProtocol
    
    init(httpClient: HTTPClientProtocol = AFHTTPClient()) {
        self.httpClient = httpClient
    }
    
    func getUsers() -> AnyPublisher<[UserResponse], NetworkError> {
        httpClient.request(url: UserAPIRouter.getUsers)
    }
    
    func getUserPosts(by id: Int) -> AnyPublisher<[UserIdResponse], NetworkError> {
        httpClient.request(url: UserAPIRouter.getUserPostsId(id: id))
    }
}
