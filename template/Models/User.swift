import Foundation
import Supabase

// We'll use Supabase's User type directly
typealias User = Auth.User

// MARK: - Mock Data

extension User {
    static var mock: User {
        User(
            id: UUID(),
            appMetadata: [:],
            userMetadata: [:],
            aud: "authenticated",
            confirmationSentAt: nil,
            recoverySentAt: nil,
            emailChangeSentAt: nil,
            newEmail: nil,
            invitedAt: nil,
            actionLink: nil,
            email: "user@example.com",
            phone: nil,
            createdAt: Date(),
            confirmedAt: nil,
            emailConfirmedAt: nil,
            phoneConfirmedAt: nil,
            lastSignInAt: Date(),
            role: "authenticated",
            updatedAt: Date(),
            identities: [],
            isAnonymous: false,
            factors: []
        )
    }
} 
