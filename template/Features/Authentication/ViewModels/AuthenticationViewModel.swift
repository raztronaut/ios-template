import Foundation
import SwiftUI

@Observable final class AuthenticationViewModel {
    // MARK: - Properties
    
    private let authService: AuthenticationService
    
    var email = ""
    var password = ""
    var isLoading = false
    var showError = false
    var errorMessage = ""
    
    var isEmailValid: Bool {
        email.contains("@") && email.contains(".")
    }
    
    var isPasswordValid: Bool {
        password.count >= 8
    }
    
    var canSubmit: Bool {
        !isLoading && isEmailValid && isPasswordValid
    }
    
    // MARK: - Initialization
    
    init(authService: AuthenticationService = AuthenticationService()) {
        self.authService = authService
    }
    
    // MARK: - Public Methods
    
    @MainActor
    func signIn() async {
        isLoading = true
        showError = false
        
        do {
            try await authService.signIn(email: email, password: password)
        } catch {
            showError = true
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    @MainActor
    func signUp() async {
        isLoading = true
        showError = false
        
        do {
            try await authService.signUp(email: email, password: password)
        } catch {
            showError = true
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    func resetForm() {
        email = ""
        password = ""
        showError = false
        errorMessage = ""
    }
} 