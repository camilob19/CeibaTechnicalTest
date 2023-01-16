//
//  String.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 15/01/23.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self,
                                 tableName: "GeneralStrings",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}
