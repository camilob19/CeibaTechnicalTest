//
//  UserPostsModel.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 15/01/23.
//

import Foundation

struct UserPostsModel: Identifiable, Hashable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

extension UserPostsModel {
    static let fixture = Self(userId: 1,
                              id: 1,
                              title: "message",
                              body: "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi")
}
