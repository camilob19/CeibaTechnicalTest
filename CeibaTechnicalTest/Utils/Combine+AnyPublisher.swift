//
//  Combine+AnyPublisher.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 15/01/23.
//

import Combine
import Foundation

extension AnyPublisher {
    @discardableResult
    func asyncMain() async throws -> Output {
        try await withCheckedThrowingContinuation { continuation in
            var cancellable: AnyCancellable?
            
            cancellable = first()
                .receive(on: DispatchQueue.main)
                .sink { result in
                    switch result {
                    case .finished:
                        break
                    case let .failure(error):
                        continuation.resume(throwing: error)
                    }
                    cancellable?.cancel()
                } receiveValue: { value in
                    continuation.resume(with: .success(value))
                }
        }
    }
}
