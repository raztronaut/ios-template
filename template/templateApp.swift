//
//  templateApp.swift
//  template
//
//  Created by Razi Syed on 1/19/25.
//

import SwiftUI

@main
struct templateApp: App {
    @State private var authService = AuthenticationService()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if authService.isAuthenticated {
                    ContentView()
                        .environment(authService)
                } else {
                    AuthenticationView()
                        .environment(authService)
                }
            }
        }
    }
}
