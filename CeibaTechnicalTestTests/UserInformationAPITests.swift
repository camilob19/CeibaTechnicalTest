//
//  UserInformationAPITests.swift
//  CeibaTechnicalTestTests
//
//  Created by Cristian on 15/01/23.
//

import Alamofire
import Combine
import XCTest
@testable import CeibaTechnicalTest

final class UserInformationAPITests: XCTestCase {
    
    let httpFakeClient = HTTPClientStub()
    var cancellables = Set<AnyCancellable>()
    
    var SUT: UserInformationAPI?
    
    override func setUpWithError() throws {
        SUT = UserInformationAPI(httpClient: httpFakeClient)
    }
    
    override func tearDownWithError() throws {
        SUT = nil
    }
    
    func test_getUserService_success() {
        let expectation = expectation(description: "test_getUserService_success")
        
        httpFakeClient.expectedURL = "/users"
        httpFakeClient.file = "users"
        
        SUT?.getUsers().sink { completion in
            switch completion {
            case .finished:
                break
            case .failure:
                XCTFail("error")
            }
            expectation.fulfill()
        } receiveValue: { response in
            XCTAssertEqual(response.first?.address?.city, "Gwenborough")
            expectation.fulfill()
        }.store(in: &cancellables)
        
        waitForExpectations(timeout: 1)
    }
    
    func test_getUserPosts() {
        let expectation = expectation(description: "test_getUserPosts")
        httpFakeClient.expectedURL = "/posts?userId=1"
        httpFakeClient.file = "posts"
        
        SUT?.getUserPosts(by: 1).sink { completion in
            switch completion {
            case .finished:
                break
            case .failure:
                XCTFail("error")
            }
            expectation.fulfill()
        } receiveValue: { response in
            XCTAssertEqual(response.first?.title, "sunt aut facere repellat provident occaecati excepturi optio reprehenderit")
            expectation.fulfill()
        }.store(in: &cancellables)
        
        waitForExpectations(timeout: 1)
    }
}
