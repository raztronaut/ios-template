import SwiftUI
import Foundation

struct OnboardingView: View {
    @Bindable var model: OnboardingViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            TabView(selection: $model.currentPage) {
                ForEach(model.items.indices, id: \.self) { index in
                    OnboardingPageView(item: model.items[index])
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            // Navigation Overlay
            .overlay(alignment: .bottom) {
                VStack(spacing: 16) {
                    // Page Control Indicator
                    PageControl(numberOfPages: model.items.count, currentPage: model.currentPage)
                        .padding(.horizontal)
                    
                    // Navigation Buttons
                    HStack(spacing: 12) {
                        if model.currentPage > 0 {
                            Button {
                                model.previousPage()
                            } label: {
                                Text("Back")
                                    .fontWeight(.medium)
                                    .foregroundStyle(.white)
                            }
                            .frame(width: 80)
                            .padding(.vertical, 14)
                            .background(.white.opacity(0.1))
                            .clipShape(Capsule())
                        }
                        
                        Button {
                            model.nextPage()
                        } label: {
                            HStack {
                                Text(model.currentPage == model.items.count - 1 ? "Get Started" : "Continue")
                                    .fontWeight(.semibold)
                                
                                if model.currentPage < model.items.count - 1 {
                                    Image(systemName: "chevron.right")
                                }
                            }
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(.blue)
                            .clipShape(Capsule())
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, geometry.safeAreaInsets.bottom + 20)
            }
            
            // Skip Button
            .overlay(alignment: .topTrailing) {
                if model.currentPage < model.items.count - 1 {
                    Button {
                        model.skipOnboarding()
                    } label: {
                        Text("Skip")
                            .foregroundStyle(.white.opacity(0.7))
                            .fontWeight(.medium)
                    }
                    .padding()
                }
            }
        }
        .background(.black)
        .onChange(of: model.hasSeenOnboarding) { _, hasSeenOnboarding in
            if hasSeenOnboarding {
                dismiss()
            }
        }
    }
}

struct PageControl: View {
    let numberOfPages: Int
    let currentPage: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages, id: \.self) { page in
                Circle()
                    .fill(page == currentPage ? .white : .white.opacity(0.3))
                    .frame(width: 6, height: 6)
            }
        }
    }
}

#Preview {
    OnboardingView(model: OnboardingViewModel())
} 