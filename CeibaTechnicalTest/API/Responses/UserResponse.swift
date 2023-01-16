//
//  UserResponse.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 14/01/23.
//

import Alamofire
import Foundation

struct UserResponse: Codable {
    let id: Int
    let name: String
    let email: String
    let address: AdressInformation?
    let phone: String
}

struct AdressInformation: Codable {
    let city: String
}
