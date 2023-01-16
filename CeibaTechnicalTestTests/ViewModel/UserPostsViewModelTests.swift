//
//  UserPostsViewModelTests.swift
//  CeibaTechnicalTestTests
//
//  Created by Cristian on 16/01/23.
//

import XCTest
@testable import CeibaTechnicalTest


final class UserPostsViewModelTests: XCTestCase {
    
    func test_onAppear_Success() async {
        let SUT = UserPostsViewModel(state: UserPostsViewModel.State(currentId: 1),
                                     useCase: UserPostsUseCaseFakeSuccess())
        await SUT.onAppear()
        
        await MainActor.run {
            XCTAssertEqual(SUT.state.currentId, 1)
            XCTAssertEqual(SUT.state.userPostsInfo, [UserPostsModel.fixture])
            XCTAssertEqual(SUT.state.loading, false)
        }
    }

}
