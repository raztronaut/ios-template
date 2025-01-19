import SwiftUI
import Foundation

struct OnboardingPageView: View {
    let item: OnboardingItem
    
    var body: some View {
        ZStack {
            // Background
            Color.black
                .ignoresSafeArea()
            
            // Content
            VStack(spacing: 32) {
                Spacer()
                
                // Icon Container
                ZStack {
                    Circle()
                        .fill(.purple.opacity(0.2))
                        .frame(width: 120, height: 120)
                    
                    Image(systemName: item.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.purple)
                }
                .padding(.bottom, 48)
                
                // Content Container
                VStack(spacing: 16) {
                    Text(item.title)
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                    
                    Text(item.subtitle)
                        .font(.system(size: 15, weight: .regular, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white.opacity(0.7))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.horizontal, 32)
                
                Spacer()
                Spacer()
                    .frame(height: 60) // Extra space for buttons
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(item.title), \(item.subtitle)")
    }
}

#Preview {
    OnboardingPageView(item: OnboardingItem.samples[0])
} 