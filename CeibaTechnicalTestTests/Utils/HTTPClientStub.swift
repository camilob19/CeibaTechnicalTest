//
//  HTTPClientStub.swift
//  CeibaTechnicalTestTests
//
//  Created by Cristian on 15/01/23.
//

import Foundation
import Alamofire
import Combine
import XCTest
@testable import CeibaTechnicalTest

class HTTPClientStub: HTTPClientProtocol {
    
    var file: String = ""
    var expectedURL: String = ""
    var sourceFile: StaticString
    var line: UInt
    
    init(in sourceFile: StaticString = #file,
         line: UInt = #line) {
        self.sourceFile = sourceFile
        self.line = line
        
    }
    
    func request<T>(url: URLRequestConvertible) -> AnyPublisher<T, NetworkError> where T: Decodable {
        guard let fullURL = url.urlRequest?.description,
              fullURL.contains(expectedURL) else {
            XCTFail("URL doesn't match", file: sourceFile, line: line)
            return Fail<T, NetworkError>(error: NetworkError(initialError: AFError.explicitlyCancelled)).eraseToAnyPublisher()
        }
        
        guard let responseJson = self.loadJson(filename: file, T: T.self) else {
            XCTFail("Json doesn't match", file: sourceFile, line: line)
            return Fail<T, NetworkError>(error: NetworkError(initialError: AFError.explicitlyCancelled)).eraseToAnyPublisher()
        }
        
        return CurrentValueSubject<T, NetworkError>(responseJson).eraseToAnyPublisher()
    }
    
    func loadJson<T:Decodable>(filename fileName: String,
                               T: T.Type,
                               in sourceFile: StaticString = #file,
                               line: UInt = #line) -> T? {
        if let url = Bundle(for: HTTPClientStub.self).url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            } catch {
                XCTFail("Decoder Error", file: sourceFile, line: line)
                print("error:\(error)")
            }
        }
        return nil
    }
}
