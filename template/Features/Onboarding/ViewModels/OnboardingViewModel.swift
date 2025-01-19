import SwiftUI
import Foundation

@Observable
final class OnboardingViewModel {
    var currentPage = 0
    let items = OnboardingItem.samples
    var hasSeenOnboarding: Bool {
        get { UserDefaults.standard.bool(forKey: "hasSeenOnboarding") }
        set { UserDefaults.standard.set(newValue, forKey: "hasSeenOnboarding") }
    }
    
    func nextPage() {
        if currentPage < items.count - 1 {
            currentPage += 1
        } else {
            completeOnboarding()
        }
    }
    
    func previousPage() {
        if currentPage > 0 {
            currentPage -= 1
        }
    }
    
    func completeOnboarding() {
        hasSeenOnboarding = true
    }
    
    func skipOnboarding() {
        completeOnboarding()
    }
} 