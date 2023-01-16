//
//  UserPostsViewModel.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 15/01/23.
//

import Combine
import Foundation
import SwiftUI

class UserPostsViewModel: ObservableObject {
    
    struct State {
        var currentId: Int
        var loading: Bool = false
        var userPostsInfo: [UserPostsModel] = []
    }
    
    @Published var state: State
    
    let useCase: UserPostsUseCaseProtocol
    init(state: State,
         useCase: UserPostsUseCaseProtocol = UserPostsUseCaseImpl()) {
        self.useCase = useCase
        self.state = state
    }
    
    func onAppear() async {
        guard let userPosts = try? await useCase.execute(by: state.currentId).asyncMain() else {
            await MainActor.run {
                self.state.loading = false
            }
            return
        }
        
        await MainActor.run {
            self.state.userPostsInfo = userPosts
            self.state.loading = false
        }
    }
}
