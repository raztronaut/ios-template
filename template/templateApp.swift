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
    @State private var showOnboarding = false
    private let onboardingModel = OnboardingViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .sheet(isPresented: $showOnboarding) {
                    OnboardingView(model: onboardingModel)
                        .interactiveDismissDisabled()
                }
                .onAppear {
                    showOnboarding = !onboardingModel.hasSeenOnboarding
                }
        }
    }
}
