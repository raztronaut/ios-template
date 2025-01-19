//
//  templateApp.swift
//  template
//
//  Created by Razi Syed on 1/19/25.
//

import SwiftUI

@main
struct templateApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
