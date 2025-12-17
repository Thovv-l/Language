import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var showLanguageChange = false
    @State private var showResetAlert = false

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    colors: [Color.blue.opacity(0.15), Color.cyan.opacity(0.1)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 24) {
                        // Profile header
                        profileHeader

                        // Stats cards
                        statsGrid

                        // Achievements
                        achievementsSection

                        // Settings
                        settingsSection
                    }
                    .padding()
                }
            }
            .navigationTitle("Profile")
        }
    }

    var profileHeader: some View {
        VStack(spacing: 16) {
            // Avatar
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color.blue, Color.cyan],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)

                Text(String(userViewModel.user.name.prefix(1).uppercased()))
                    .font(.system(size: 42, weight: .bold))
                    .foregroundColor(.white)
            }

            // Name
            Text(userViewModel.user.name)
                .font(.system(size: 28, weight: .bold))

            // Language pair
            if let pair = userViewModel.user.languagePair {
                HStack(spacing: 8) {
                    Text(pair.native.flag)
                    Image(systemName: "arrow.right")
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                    Text(pair.learning.flag)
                }
                .font(.system(size: 24))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(Color.white.opacity(0.9))
                )
            }

            // Level
            HStack {
                Text("Level \(userViewModel.user.level)")
                    .font(.system(size: 18, weight: .semibold))

                Spacer()

                Text("\(userViewModel.user.totalXP) XP")
                    .font(.system(size: 16))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)

            // XP Progress bar
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 10)

                    RoundedRectangle(cornerRadius: 10)
                        .fill(
                            LinearGradient(
                                colors: [Color.blue, Color.cyan],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geometry.size.width * userViewModel.user.currentLevelProgress, height: 10)
                }
            }
            .frame(height: 10)
            .padding(.horizontal)

            Text("\(userViewModel.user.xpToNextLevel - (userViewModel.user.totalXP % userViewModel.user.xpToNextLevel)) XP to Level \(userViewModel.user.level + 1)")
                .font(.system(size: 12))
                .foregroundColor(.secondary)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.5))
        )
    }

    var statsGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            StatCard(
                icon: "flame.fill",
                value: "\(userViewModel.user.currentStreak)",
                label: "Day Streak",
                color: .orange
            )

            StatCard(
                icon: "chart.line.uptrend.xyaxis",
                value: "\(userViewModel.user.longestStreak)",
                label: "Best Streak",
                color: .red
            )

            StatCard(
                icon: "checkmark.circle.fill",
                value: "\(userViewModel.user.lessonProgress.filter { $0.value.isCompleted }.count)",
                label: "Completed",
                color: .green
            )

            StatCard(
                icon: "star.fill",
                value: "\(userViewModel.user.achievements.count)",
                label: "Achievements",
                color: .yellow
            )
        }
    }

    var achievementsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Achievements")
                .font(.system(size: 22, weight: .bold))

            if userViewModel.user.achievements.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "trophy.fill")
                        .font(.system(size: 48))
                        .foregroundColor(.gray.opacity(0.3))

                    Text("No achievements yet")
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)

                    Text("Complete lessons to earn achievements!")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding(30)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white.opacity(0.5))
                )
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(userViewModel.user.achievements) { achievement in
                            AchievementCard(achievement: achievement)
                        }
                    }
                }
            }
        }
    }

    var settingsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Settings")
                .font(.system(size: 22, weight: .bold))

            VStack(spacing: 12) {
                SettingRow(
                    icon: "globe",
                    title: "Change Languages",
                    action: {
                        showLanguageChange = true
                    }
                )

                SettingRow(
                    icon: "clock.fill",
                    title: "Daily Goal: \(userViewModel.user.dailyGoal) min",
                    action: {}
                )

                SettingRow(
                    icon: "arrow.clockwise",
                    title: "Reset Progress",
                    action: {
                        showResetAlert = true
                    },
                    isDestructive: true
                )
            }
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.5))
            )
        }
        .alert("Reset Progress", isPresented: $showResetAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Reset", role: .destructive) {
                userViewModel.resetProgress()
            }
        } message: {
            Text("Are you sure you want to reset all your progress? This cannot be undone.")
        }
        .sheet(isPresented: $showLanguageChange) {
            LanguageChangeView()
        }
    }
}

struct StatCard: View {
    let icon: String
    let value: String
    let label: String
    let color: Color

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 32))
                .foregroundColor(color)

            Text(value)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.primary)

            Text(label)
                .font(.system(size: 14))
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.5))
        )
    }
}

struct AchievementCard: View {
    let achievement: Achievement

    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color.yellow.opacity(0.2))
                    .frame(width: 80, height: 80)

                Image(systemName: achievement.icon)
                    .font(.system(size: 36))
                    .foregroundColor(.yellow)
            }

            Text(achievement.title)
                .font(.system(size: 16, weight: .semibold))
                .multilineTextAlignment(.center)

            Text(achievement.description)
                .font(.system(size: 12))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(width: 140)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.5))
        )
    }
}

struct SettingRow: View {
    let icon: String
    let title: String
    let action: () -> Void
    var isDestructive: Bool = false

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(isDestructive ? .red : .blue)
                    .frame(width: 30)

                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(isDestructive ? .red : .primary)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            .padding()
        }
    }
}

struct LanguageChangeView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedNativeLanguage: SupportedLanguage?
    @State private var selectedLearningLanguage: SupportedLanguage?

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    colors: [Color.blue.opacity(0.15), Color.cyan.opacity(0.1)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Change Languages")
                        .font(.system(size: 28, weight: .bold))
                        .padding(.top)

                    Text("Native Language")
                        .font(.system(size: 18, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)

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
                        .padding(.horizontal)

                        if selectedNativeLanguage != nil {
                            Text("Learning Language")
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .padding(.top)

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
                            .padding(.horizontal)
                        }
                    }

                    if let native = selectedNativeLanguage,
                       let learning = selectedLearningLanguage {
                        Button(action: {
                            userViewModel.setLanguagePair(native: native, learning: learning)
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Save Changes")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.yellow)
                                .cornerRadius(16)
                        }
                        .padding()
                    }
                }
            }
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
        .onAppear {
            selectedNativeLanguage = userViewModel.user.languagePair?.native
            selectedLearningLanguage = userViewModel.user.languagePair?.learning
        }
    }
}
