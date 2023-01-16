//
//  UserListUseCaseFake.swift
//  CeibaTechnicalTestTests
//
//  Created by Cristian on 16/01/23.
//

import Foundation
import Combine
import Alamofire
@testable import CeibaTechnicalTest

class UserListUseCaseFakeSuccess: UserListUseCaseProtocol {
    func execute() -> AnyPublisher<[UserModel], NetworkError> {
        return CurrentValueSubject<[UserModel], NetworkError>([UserModel.fixture]).eraseToAnyPublisher()
    }
}

class UserListUseCaseFakeFailure: UserListUseCaseProtocol {
    func execute() -> AnyPublisher<[UserModel], NetworkError> {
        return Fail<[UserModel], NetworkError>(error: NetworkError(initialError: AFError.explicitlyCancelled)).eraseToAnyPublisher()
    }
}
