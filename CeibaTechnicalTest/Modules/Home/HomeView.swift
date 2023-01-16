//
//  HomeView.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 15/01/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.state.filteredUserList.isEmpty {
                Text(Localized.emptyListText)
            }
            if viewModel.state.loading {
                ProgressView()
            }
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.state.filteredUserList) { user in
                        NavigationLink {
                            UserPostsView(from: user.id)
                        } label: {
                            CardInformationView(name: user.name,
                                                number: user.phone,
                                                mail: user.email,
                                                iconOne: Image(systemName: "phone.fill"),
                                                iconTwo: Image(systemName:"envelope.fill"),
                                                buttonName: Localized.buttonText)
                        }
                    }.padding(.vertical, 4)
                }
            }
            .refreshable {
                await viewModel.onAppear()
            }
            .searchable(text: Binding(get: {
                return viewModel.state.textToFilter
            }, set: { text, _ in
                viewModel.state.textToFilter = text
                viewModel.search()
            }))
            .task {
                await viewModel.onAppear()
            }
            .navigationTitle(Localized.navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .padding(.bottom)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
