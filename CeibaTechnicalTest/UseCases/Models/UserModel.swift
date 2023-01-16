//
//  UserModel.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 15/01/23.
//

import Foundation

struct UserModel: Identifiable, Hashable {
    let id: Int
    let name: String
    let email: String
    let address: AdressInformationModel?
    let phone: String
}

struct AdressInformationModel: Hashable {
    let city: String
}

extension UserModel {
    static let fixture = Self(id: 1,
                              name: "demo",
                              email: "",
                              address: nil,
                              phone: "")
}
