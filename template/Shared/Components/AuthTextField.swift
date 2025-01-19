import SwiftUI
import UIKit

struct AuthTextField: View {
    let title: String
    let text: Binding<String>
    let icon: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    var textContentType: UITextContentType?
    
    @State private var isTextVisible = false
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .foregroundStyle(.secondary)
                .font(.subheadline)
            
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .foregroundStyle(.secondary)
                    .frame(width: 20)
                
                Group {
                    if isSecure && !isTextVisible {
                        SecureField("", text: text)
                            .textContentType(textContentType)
                            .focused($isFocused)
                    } else {
                        TextField("", text: text)
                            .textContentType(textContentType)
                            .keyboardType(keyboardType)
                            .focused($isFocused)
                    }
                }
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                
                if isSecure {
                    Button {
                        isTextVisible.toggle()
                    } label: {
                        Image(systemName: isTextVisible ? "eye.slash" : "eye")
                            .foregroundStyle(.secondary)
                            .frame(width: 20)
                    }
                }
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(uiColor: .systemGray6))
            }
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        AuthTextField(
            title: "Email",
            text: .constant(""),
            icon: "envelope",
            keyboardType: .emailAddress,
            textContentType: .emailAddress
        )
        
        AuthTextField(
            title: "Password",
            text: .constant(""),
            icon: "lock",
            isSecure: true,
            textContentType: .password
        )
    }
    .padding()
} 