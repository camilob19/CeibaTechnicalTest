//
//  UserIdResponse.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 14/01/23.
//

import Alamofire
import Foundation

struct UserIdResponse: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
