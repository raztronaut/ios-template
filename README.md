# iOS Template

A modern iOS app template built with SwiftUI, following best practices and including common features needed for most apps.

## Features

- [x] Modern Onboarding Experience
  - Multi-page onboarding with smooth transitions
  - Skip functionality
  - Persistent state management
- [x] Authentication
  - Email/Password authentication
  - Clean MVVM architecture
  - Supabase Auth integration
  - Secure credential handling
  - Modern SwiftUI form design
  - Keyboard handling & form validation
- [ ] In-App Purchases (Coming Soon)
  - Built-in IAP support
  - Revenue generation ready
- [ ] Analytics Integration (Coming Soon)
- [ ] Push Notifications with OneSignal (Coming Soon)
- [ ] Settings Screen (Coming Soon)

## Project Structure

The project follows a Domain-Driven Design pattern:

```
Sources/
├── App/
│   └── MainApp.swift
├── Features/ 
│   ├── Authentication/
│   │   ├── Views/
│   │   │   └── AuthenticationView.swift
│   │   └── ViewModels/
│   │       └── AuthenticationViewModel.swift
│   ├── Home/
│   │   ├── Views/
│   │   └── ViewModels/
│   └── Profile/
│       ├── Views/
│       └── ViewModels/
├── Shared/
│   ├── Components/
│   │   └── AuthTextField.swift
│   ├── Modifiers/
│   └── Styles/
├── Models/
│   └── User.swift
├── Services/
│   └── Network/
│       └── AuthenticationService.swift
└── Core/
    ├── Extensions/
    ├── Utilities/
    └── Constants/
        └── Config.swift
```

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+
- Supabase Account (for authentication)

## Installation

1. Clone the repository
```bash
git clone https://github.com/raztronaut/ios-template.git
```

2. Open the project in Xcode
```bash
cd ios-template
open template.xcodeproj
```

3. Configure Supabase
   - Create a project at [Supabase](https://supabase.com)
   - Enable Email auth in Authentication → Providers
   - Update `Config.swift` with your project URL and anon key

4. Build and run the project

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details 