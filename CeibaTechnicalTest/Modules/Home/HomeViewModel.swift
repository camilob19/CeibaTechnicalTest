//
//  HomeViewModel.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 15/01/23.
//

import Combine
import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    struct State {
        var textToFilter: String = ""
        var loading: Bool = false
        var userList: [UserModel] = []
        var filteredUserList: [UserModel] = []
    }
    
    @Published var state = State()
    
    let useCase: UserListUseCaseProtocol
    init(useCase: UserListUseCaseProtocol = UserListUseCaseImpl()) {
        self.useCase = useCase
    }
    
    func search() {
        guard !state.textToFilter.isEmpty else {
            state.filteredUserList = state.userList
            return
        }
        
        state.filteredUserList = state.userList.filter{ $0.name.lowercased().contains(state.textToFilter.lowercased()) }
    }
    
    func onAppear() async {
        guard let userList = try? await useCase.execute().asyncMain() else {
            await MainActor.run {
                self.state.loading = false
            }
            return
        }
        
        await MainActor.run {
            self.state.userList = userList
            self.state.filteredUserList = userList
            self.state.loading = false
        }
    }
}
