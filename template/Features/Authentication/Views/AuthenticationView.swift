import SwiftUI

struct AuthenticationView: View {
    @Bindable private var viewModel: AuthenticationViewModel
    @State private var authMode: AuthMode = .signIn
    @Environment(\.dismiss) private var dismiss
    @FocusState private var focusedField: Field?
    
    init(viewModel: AuthenticationViewModel = AuthenticationViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Logo or App Icon
                    Image(systemName: "lock.shield")
                        .font(.system(size: 60))
                        .foregroundStyle(.tint)
                        .padding(.vertical, 32)
                    
                    // Form Fields
                    VStack(spacing: 16) {
                        AuthTextField(
                            title: "Email",
                            text: $viewModel.email,
                            icon: "envelope",
                            keyboardType: .emailAddress,
                            textContentType: .emailAddress
                        )
                        .focused($focusedField, equals: .email)
                        .submitLabel(.next)
                        
                        AuthTextField(
                            title: "Password",
                            text: $viewModel.password,
                            icon: "lock",
                            isSecure: true,
                            textContentType: authMode == .signIn ? .password : .newPassword
                        )
                        .focused($focusedField, equals: .password)
                        .submitLabel(.go)
                    }
                    
                    // Action Button
                    Button(action: {
                        Task {
                            switch authMode {
                            case .signIn:
                                await viewModel.signIn()
                            case .signUp:
                                await viewModel.signUp()
                            }
                        }
                    }) {
                        if viewModel.isLoading {
                            ProgressView()
                                .tint(.white)
                        } else {
                            Text(authMode.buttonTitle)
                        }
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(viewModel.canSubmit ? Color.accentColor : Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .disabled(!viewModel.canSubmit)
                    
                    // Mode Switch
                    Picker("Authentication Mode", selection: $authMode) {
                        ForEach(AuthMode.allCases) { mode in
                            Text(mode.title)
                                .tag(mode)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: authMode) {
                        viewModel.resetForm()
                    }
                }
                .padding()
            }
            .scrollDismissesKeyboard(.immediately)
            .navigationTitle("Welcome")
            .navigationBarTitleDisplayMode(.large)
            .alert("Error", isPresented: $viewModel.showError) {
                Button("OK") {}
            } message: {
                Text(viewModel.errorMessage)
            }
            .onSubmit {
                switch focusedField {
                case .email:
                    focusedField = .password
                case .password:
                    if viewModel.canSubmit {
                        Task {
                            switch authMode {
                            case .signIn:
                                await viewModel.signIn()
                            case .signUp:
                                await viewModel.signUp()
                            }
                        }
                    }
                case .none:
                    break
                }
            }
        }
    }
}

// MARK: - Field

private enum Field {
    case email
    case password
}

// MARK: - AuthMode

enum AuthMode: CaseIterable, Identifiable {
    case signIn
    case signUp
    
    var id: Self { self }
    
    var title: String {
        switch self {
        case .signIn:
            return "Sign In"
        case .signUp:
            return "Sign Up"
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .signIn:
            return "Sign In"
        case .signUp:
            return "Create Account"
        }
    }
}

#Preview {
    AuthenticationView()
} 