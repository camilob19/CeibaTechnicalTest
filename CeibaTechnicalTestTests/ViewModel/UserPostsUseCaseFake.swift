//
//  UserPostsUseCaseFake.swift
//  CeibaTechnicalTestTests
//
//  Created by Cristian on 16/01/23.
//

import Foundation
import Combine
import Alamofire
@testable import CeibaTechnicalTest

class UserPostsUseCaseFakeSuccess: UserPostsUseCaseProtocol {
    func execute(by id: Int) -> AnyPublisher<[UserPostsModel], NetworkError> {
        return CurrentValueSubject<[UserPostsModel],
                                    NetworkError>([UserPostsModel.fixture])
            .eraseToAnyPublisher()
    }
}

class UserPostsUseCaseFakeFailure: UserPostsUseCaseProtocol {
    func execute(by id: Int) -> AnyPublisher<[UserPostsModel], NetworkError> {
        return Fail<[UserPostsModel],
                        NetworkError>(error: NetworkError(initialError: AFError.explicitlyCancelled))
            .eraseToAnyPublisher()
    }
}
