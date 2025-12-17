import SwiftUI

@main
struct LanguageApp: App {
    @StateObject private var userViewModel = UserViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userViewModel)
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        if userViewModel.user.languagePair == nil {
            OnboardingView()
        } else {
            MainTabView()
        }
    }
}
