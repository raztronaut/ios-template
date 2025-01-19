import Foundation
import Supabase

/// Service responsible for handling all authentication-related operations
@Observable final class AuthenticationService {
    // MARK: - Properties
    
    private let supabase: SupabaseClient
    private(set) var currentUser: User?
    private(set) var authError: Error?
    private(set) var isAuthenticated = false
    
    // MARK: - Initialization
    
    init() {
        // Initialize Supabase client
        self.supabase = SupabaseClient(
            supabaseURL: Config.Supabase.url,
            supabaseKey: Config.Supabase.anonKey
        )
        
        // Check for existing session
        Task {
            await checkAndUpdateSession()
        }
    }
    
    // MARK: - Public Methods
    
    /// Signs in user with email and password
    @MainActor
    func signIn(email: String, password: String) async throws {
        do {
            let session = try await supabase.auth.signIn(
                email: email,
                password: password
            )
            currentUser = session.user
            isAuthenticated = currentUser != nil
            authError = nil
        } catch {
            authError = error
            throw error
        }
    }
    
    /// Signs up user with email and password
    @MainActor
    func signUp(email: String, password: String) async throws {
        do {
            let session = try await supabase.auth.signUp(
                email: email,
                password: password
            )
            currentUser = session.user
            isAuthenticated = currentUser != nil
            authError = nil
        } catch {
            authError = error
            throw error
        }
    }
    
    /// Signs out the current user
    @MainActor
    func signOut() async throws {
        do {
            try await supabase.auth.signOut()
            currentUser = nil
            isAuthenticated = false
            authError = nil
        } catch {
            authError = error
            throw error
        }
    }
    
    // MARK: - Private Methods
    
    @MainActor
    private func checkAndUpdateSession() async {
        do {
            let session = try await supabase.auth.session
            currentUser = session.user
            isAuthenticated = currentUser != nil
            authError = nil
        } catch {
            currentUser = nil
            isAuthenticated = false
            authError = error
        }
    }
} 