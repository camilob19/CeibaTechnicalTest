//
//  UserPostsView.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 15/01/23.
//

import SwiftUI

struct UserPostsView: View {
    @StateObject var viewModel: UserPostsViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    init(from currentId: Int) {
        _viewModel = StateObject.init(wrappedValue: .init(state: .init(currentId: currentId)))
    }
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        ImageAsset.backButtonImage
                            .fontWeight(.semibold)
                            .foregroundColor(.sherpaBlue)
                            .font(.system(size: 20))
                    }
                    .padding([.leading, .bottom])
                    Spacer()
                }
                LazyVStack {
                    ForEach(viewModel.state.userPostsInfo) { info in
                        DetailCardInformationView(title: info.title,
                                                  detail: info.body)
                    }
                    .padding(.vertical, 5)
                }
            }
            .task {
                await viewModel.onAppear()
            }
        }
        .navigationBarHidden(true)
        .padding(.vertical)
    }
}

struct UserPostsView_Previews: PreviewProvider {
    static var previews: some View {
        UserPostsView(from: 1)
    }
}
