//
//  HomeViewModelTests.swift
//  CeibaTechnicalTestTests
//
//  Created by Cristian on 16/01/23.
//

import XCTest
@testable import CeibaTechnicalTest

final class HomeViewModelTests: XCTestCase {
    
    func test_onAppear_Success() async {
        let SUT = HomeViewModel(useCase: UserListUseCaseFakeSuccess())
        await SUT.onAppear()
        
        await MainActor.run {
            XCTAssertEqual(SUT.state.userList, [UserModel.fixture])
            XCTAssertEqual(SUT.state.filteredUserList, [UserModel.fixture])
            XCTAssertEqual(SUT.state.loading, false)
        }
    }
    
    func test_onAppear_Failure() async {
        let SUT = HomeViewModel(useCase: UserListUseCaseFakeFailure())
        await SUT.onAppear()
        
        await MainActor.run {
            XCTAssertEqual(SUT.state.userList, [])
            XCTAssertEqual(SUT.state.filteredUserList, [])
            XCTAssertEqual(SUT.state.loading, false)
        }
    }
    
    func test_filterText() {
        let SUT = HomeViewModel()
        SUT.state.userList = [UserModel.fixture]
        SUT.state.filteredUserList = [UserModel.fixture]
        SUT.state.textToFilter = "a"
        
        SUT.search()
        
        XCTAssertEqual(SUT.state.filteredUserList, [])
        XCTAssertEqual(SUT.state.userList, [UserModel.fixture])
        
        SUT.state.filteredUserList = [UserModel.fixture]
        SUT.state.textToFilter = "DEM"
        
        XCTAssertEqual(SUT.state.filteredUserList, [UserModel.fixture])
        XCTAssertEqual(SUT.state.userList, [UserModel.fixture])
    }

}
