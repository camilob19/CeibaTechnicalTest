//
//  HTTPClient.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 14/01/23.
//

import Alamofire
import Combine
import Foundation

protocol HTTPClientProtocol: AnyObject {
    func request<T: Decodable>(url: URLRequestConvertible) -> AnyPublisher<T, NetworkError>
}

class AFHTTPClient: HTTPClientProtocol {
    let configuration = URLSessionConfiguration.af.default
    let session: Session
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    init() {
        configuration.allowsCellularAccess = false
        session = Session(configuration: configuration)
    }
    
    func request<T: Decodable>(url: URLRequestConvertible) -> AnyPublisher<T, NetworkError> {
        Deferred {
            Future { promise in
                self.session
                    .request(url)
                    .validate()
                    .responseDecodable(of: T.self, decoder: self.decoder) { response in
                        switch response.result {
                        case .success(let res):
                            promise(.success(res))
                        case .failure(let error):
                            let error = NetworkError(initialError: error)
                            promise(.failure(error))
                        }
                    }
            }
        }
        .eraseToAnyPublisher()
    }
}
