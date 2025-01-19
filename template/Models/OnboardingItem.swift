import Foundation

struct OnboardingItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
    
    static let samples = [
        OnboardingItem(
            title: "Welcome to Razi's Template",
            subtitle: "Your ultimate iOS app starter template with everything you need to build amazing apps",
            imageName: "sparkles.rectangle.stack"
        ),
        OnboardingItem(
            title: "Authentication Made Easy",
            subtitle: "Secure authentication with Apple Sign In and magic link support out of the box",
            imageName: "lock.shield"
        ),
        OnboardingItem(
            title: "Monetize Your App",
            subtitle: "Built-in IAP support to help you generate revenue from your app",
            imageName: "creditcard"
        )
    ]
} 