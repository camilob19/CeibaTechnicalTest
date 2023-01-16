//
//  UserPostsUseCase.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 14/01/23.
//

import Combine
import Foundation

protocol UserPostsUseCaseProtocol {
    func execute(by id: Int) -> AnyPublisher<[UserPostsModel], NetworkError>
}

struct UserPostsUseCaseImpl: UserPostsUseCaseProtocol {
    
    let repository: UserListRepositoryProtocol
    
    init(repository: UserListRepositoryProtocol = UserListRepository()) {
        self.repository = repository
    }
    
    func execute(by id: Int) -> AnyPublisher<[UserPostsModel], NetworkError> {
        repository.getUserposts(by: id)
            .map {
                return $0.map { info in
                    return UserPostsModel(userId: info.userId,
                                          id: info.id,
                                          title: info.title,
                                          body: info.body)
                }
            }
            .eraseToAnyPublisher()
    }
}
