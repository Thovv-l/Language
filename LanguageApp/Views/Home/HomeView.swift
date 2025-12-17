import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Learn", systemImage: "book.fill")
                }
                .tag(0)

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(1)
        }
    }
}

struct HomeView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        NavigationView {
            ZStack {
                // Gradient background
                LinearGradient(
                    colors: [Color.blue.opacity(0.15), Color.cyan.opacity(0.1)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 24) {
                        // Header with user info
                        headerSection

                        // Streak and progress card
                        streakCard

                        // Daily goal
                        dailyGoalCard

                        // Lessons section
                        lessonsSection
                    }
                    .padding()
                }
            }
            .navigationBarHidden(true)
        }
    }

    var headerSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Hello, \(userViewModel.user.name)")
                    .font(.system(size: 28, weight: .bold))

                if let pair = userViewModel.user.languagePair {
                    Text("Learning \(pair.learning.displayName)")
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                }
            }

            Spacer()

            // Level badge
            VStack(spacing: 2) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 20))

                Text("Level \(userViewModel.user.level)")
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding(12)
            .background(
                Circle()
                    .fill(Color.white.opacity(0.9))
            )
        }
    }

    var streakCard: some View {
        HStack(spacing: 20) {
            // Current streak
            VStack(spacing: 8) {
                HStack(spacing: 4) {
                    Text("🔥")
                        .font(.system(size: 32))
                    Text("\(userViewModel.user.currentStreak)")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.orange)
                }
                Text("Day Streak")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity)

            Divider()
                .frame(height: 60)

            // Total XP
            VStack(spacing: 8) {
                HStack(spacing: 4) {
                    Text("⭐")
                        .font(.system(size: 32))
                    Text("\(userViewModel.user.totalXP)")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.blue)
                }
                Text("Total XP")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.9))
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
        )
    }

    var dailyGoalCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Daily Goal")
                    .font(.system(size: 18, weight: .semibold))

                Spacer()

                Text("\(userViewModel.user.dailyGoal) min")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }

            // Progress bar
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 12)

                    RoundedRectangle(cornerRadius: 10)
                        .fill(
                            LinearGradient(
                                colors: [Color.blue, Color.cyan],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geometry.size.width * userViewModel.user.currentLevelProgress, height: 12)
                }
            }
            .frame(height: 12)

            Text("Keep it up! You're doing great!")
                .font(.system(size: 14))
                .foregroundColor(.secondary)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.9))
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
        )
    }

    var lessonsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Your Lessons")
                .font(.system(size: 22, weight: .bold))

            ForEach(userViewModel.availableLessons) { lesson in
                NavigationLink(destination: LessonDetailView(lesson: lesson)) {
                    LessonCard(lesson: lesson)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct LessonCard: View {
    @EnvironmentObject var userViewModel: UserViewModel
    let lesson: Lesson

    var progress: LessonProgress? {
        userViewModel.getLessonProgress(for: lesson.id)
    }

    var body: some View {
        HStack(spacing: 16) {
            // Icon
            ZStack {
                Circle()
                    .fill(categoryColor.opacity(0.2))
                    .frame(width: 56, height: 56)

                Image(systemName: lesson.category.icon)
                    .font(.system(size: 24))
                    .foregroundColor(categoryColor)
            }

            // Content
            VStack(alignment: .leading, spacing: 4) {
                Text(lesson.title)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.primary)

                Text(lesson.category.rawValue + " • \(lesson.estimatedMinutes) min")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)

                if let progress = progress, progress.isCompleted {
                    HStack(spacing: 4) {
                        ForEach(0..<3) { index in
                            Image(systemName: index < progress.stars ? "star.fill" : "star")
                                .font(.system(size: 12))
                                .foregroundColor(.yellow)
                        }
                    }
                }
            }

            Spacer()

            // XP reward
            VStack {
                Text("+\(lesson.xpReward)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.blue)
                Text("XP")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.9))
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
        )
    }

    var categoryColor: Color {
        switch lesson.category.color {
        case "blue": return .blue
        case "green": return .green
        case "orange": return .orange
        case "purple": return .purple
        case "pink": return .pink
        case "cyan": return .cyan
        case "indigo": return .indigo
        case "red": return .red
        case "teal": return .teal
        case "yellow": return .yellow
        case "mint": return .mint
        default: return .blue
        }
    }
}
