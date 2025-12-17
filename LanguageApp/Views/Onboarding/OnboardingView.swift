import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var currentStep: Int = 0
    @State private var selectedNativeLanguage: SupportedLanguage?
    @State private var selectedLearningLanguage: SupportedLanguage?

    var body: some View {
        ZStack {
            // Gradient background inspired by the design
            LinearGradient(
                colors: [Color.blue.opacity(0.3), Color.cyan.opacity(0.2)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {
                if currentStep == 0 {
                    welcomeScreen
                } else if currentStep == 1 {
                    nativeLanguageSelection
                } else if currentStep == 2 {
                    learningLanguageSelection
                }
            }
            .padding()
        }
    }

    var welcomeScreen: some View {
        VStack(spacing: 30) {
            Spacer()

            Text("🌍")
                .font(.system(size: 100))

            Text("Welcome to Language")
                .font(.system(size: 34, weight: .bold))
                .multilineTextAlignment(.center)

            Text("Learn real-world phrases\nthat you'll actually use")
                .font(.system(size: 18))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)

            Spacer()

            Button(action: {
                withAnimation {
                    currentStep = 1
                }
            }) {
                Text("Get Started")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(16)
            }
            .padding(.horizontal)
        }
    }

    var nativeLanguageSelection: some View {
        VStack(spacing: 25) {
            VStack(spacing: 10) {
                Text("What's your native language?")
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)

                Text("We'll use this to teach you")
                    .font(.system(size: 16))
                    .foregroundColor(.secondary)
            }

            ScrollView {
                VStack(spacing: 12) {
                    ForEach(SupportedLanguage.allCases, id: \.self) { language in
                        LanguageButton(
                            language: language,
                            isSelected: selectedNativeLanguage == language
                        ) {
                            selectedNativeLanguage = language
                        }
                    }
                }
            }

            if selectedNativeLanguage != nil {
                Button(action: {
                    withAnimation {
                        currentStep = 2
                    }
                }) {
                    Text("Continue")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(16)
                }
            }
        }
        .padding()
    }

    var learningLanguageSelection: some View {
        VStack(spacing: 25) {
            VStack(spacing: 10) {
                Text("What do you want to learn?")
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)

                Text("Choose your target language")
                    .font(.system(size: 16))
                    .foregroundColor(.secondary)
            }

            ScrollView {
                VStack(spacing: 12) {
                    ForEach(SupportedLanguage.allCases, id: \.self) { language in
                        if language != selectedNativeLanguage {
                            LanguageButton(
                                language: language,
                                isSelected: selectedLearningLanguage == language
                            ) {
                                selectedLearningLanguage = language
                            }
                        }
                    }
                }
            }

            if selectedLearningLanguage != nil {
                Button(action: {
                    if let native = selectedNativeLanguage,
                       let learning = selectedLearningLanguage {
                        userViewModel.setLanguagePair(native: native, learning: learning)
                    }
                }) {
                    Text("Start Learning")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(16)
                }
            }
        }
        .padding()
    }
}

struct LanguageButton: View {
    let language: SupportedLanguage
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(language.flag)
                    .font(.system(size: 32))

                Text(language.displayName)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.primary)

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.blue)
                        .font(.system(size: 24))
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(isSelected ? Color.blue.opacity(0.1) : Color.white.opacity(0.8))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
            )
        }
    }
}
