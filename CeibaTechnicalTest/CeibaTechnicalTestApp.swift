//
//  CeibaTechnicalTestApp.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 14/01/23.
//

import SwiftUI

@main
struct CeibaTechnicalTestApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SplashScreen()
            }
        }
    }
}
