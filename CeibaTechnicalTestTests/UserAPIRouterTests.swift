//
//  UserAPIRouterTests.swift
//  CeibaTechnicalTestTests
//
//  Created by Cristian on 14/01/23.
//
import Alamofire
import XCTest
@testable import CeibaTechnicalTest

final class UserAPIRouterTests: XCTestCase {
    
    func test_getUser_success() {
        let SUT = UserAPIRouter.getUsers
        
        XCTAssertEqual(SUT.method, .get)
        XCTAssertNil(SUT.parameters)
    }
    
    func test_get_base_URL_success() {
        let SUT = UserAPIRouter.getUsers
        
        let fullURL = try? SUT.asURLRequest().description
        XCTAssertEqual(fullURL, "https://jsonplaceholder.typicode.com/users")
    }
    
    func test_get_user_Posts_Id() {
        let SUT = UserAPIRouter.getUserPostsId(id: 1)
        
        XCTAssertEqual(SUT.method, .get)
    }
    
    func test_URL_User_Posts() {
        let SUT = UserAPIRouter.getUserPostsId(id: 3)
        
        let fullURL = try? SUT.asURLRequest().description
        XCTAssertEqual(fullURL, "https://jsonplaceholder.typicode.com/posts?userId=3")
    }

}
