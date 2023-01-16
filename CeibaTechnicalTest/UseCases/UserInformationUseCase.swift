//
//  UserInformationUseCase.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 14/01/23.
//

import Combine
import Foundation

protocol UserListUseCaseProtocol {
    func execute() -> AnyPublisher<[UserModel], NetworkError>
}

struct UserListUseCaseImpl: UserListUseCaseProtocol {
    
    let repository: UserListRepositoryProtocol
    
    init(repository: UserListRepositoryProtocol = UserListRepository()) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[UserModel], NetworkError> {
        repository.getUsers()
            .map {
                return $0.map { user in
                    return UserModel(id: user.id,
                                     name: user.name,
                                     email: user.email,
                                     address: AdressInformationModel(city: user.address?.city ?? ""),
                                     phone: user.phone)
                }
            }
            .eraseToAnyPublisher()
    }
}
