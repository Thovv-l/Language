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
            ScrollView {
                VStack(spacing: 20) {
                    // Header with user info
                    headerSection

                    // Learning Progress card (green theme)
                    learningProgressCard

                    // Search bar
                    searchBar

                    // Featured Lessons
                    featuredLessonsSection

                    // All Lessons
                    allLessonsSection

                    // Quiz and Test section
                    quizTestSection
                }
                .padding(.horizontal)
                .padding(.top)
            }
            .background(Color.white)
            .navigationBarHidden(true)
        }
    }

    var headerSection: some View {
        HStack {
            // Avatar and greeting
            HStack(spacing: 12) {
                Circle()
                    .fill(Color.gray.opacity(0.1))
                    .frame(width: 40, height: 40)
                    .overlay(
                        Text("👩")
                            .font(.system(size: 24))
                    )

                Text("Hello \(userViewModel.user.name)!")
                    .font(.system(size: 20, weight: .semibold))
            }

            Spacer()

            // Language selector
            if let pair = userViewModel.user.languagePair {
                HStack(spacing: 6) {
                    Text(pair.learning.flag)
                        .font(.system(size: 18))
                    Text(pair.learning.displayName)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Color(.systemGray))
                    Image(systemName: "chevron.down")
                        .font(.system(size: 10))
                        .foregroundColor(Color(.systemGray))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color(.systemGray6))
                .cornerRadius(20)
            }
        }
    }

    var learningProgressCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Learning Progress")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)

            // Daily progress circles
            HStack(spacing: 0) {
                ForEach(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], id: \.self) { day in
                    VStack(spacing: 6) {
                        Circle()
                            .fill(day == "Mon" || day == "Tue" || day == "Wed" || day == "Thu" ? Color.white : Color.white.opacity(0.3))
                            .frame(width: 36, height: 36)
                            .overlay(
                                day == "Mon" || day == "Tue" || day == "Wed" || day == "Thu" ?
                                Text("✓")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(Color(red: 34/255, green: 197/255, blue: 94/255)) : nil
                            )

                        Text(day)
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                }
            }

            // Language info and continue button
            HStack {
                if let pair = userViewModel.user.languagePair {
                    HStack(spacing: 12) {
                        Text(pair.learning.flag)
                            .font(.system(size: 32))

                        VStack(alignment: .leading, spacing: 2) {
                            Text(pair.learning.displayName)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                            Text("6/12 Lesson")
                                .font(.system(size: 12))
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                }

                Spacer()

                Button(action: {}) {
                    Text("Continue")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(20)
                }
            }
        }
        .padding(20)
        .background(
            LinearGradient(
                colors: [Color(red: 34/255, green: 197/255, blue: 94/255), Color(red: 22/255, green: 163/255, blue: 74/255)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(24)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 4)
    }

    var searchBar: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color(.systemGray))
            Text("Search Lesson...")
                .foregroundColor(Color(.systemGray))
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }

    var featuredLessonsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Featured Lesson")
                .font(.system(size: 18, weight: .semibold))

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    FeaturedLessonCard(title: "Grammar\nBoost", emoji: "📖", color: Color(red: 249/255, green: 115/255, blue: 22/255))
                    FeaturedLessonCard(title: "Word\nMastery", emoji: "🏆", color: Color(red: 139/255, green: 92/255, blue: 246/255))
                    FeaturedLessonCard(title: "Practice\nDaily", emoji: "🎯", color: Color(red: 236/255, green: 72/255, blue: 153/255))
                }
            }
        }
    }

    var allLessonsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("All Lesson")
                .font(.system(size: 18, weight: .semibold))

            HStack(spacing: 12) {
                SmallLessonCard(emoji: "🌱", title: "Beginner Essentials", subtitle: "Learn basic vocabulary and...")
                SmallLessonCard(emoji: "🎓", title: "Intermediate Mastery", subtitle: "Expanding vocabulary and...")
            }
        }
    }

    var quizTestSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Quiz and Test")
                .font(.system(size: 18, weight: .semibold))

            ForEach(userViewModel.availableLessons.prefix(3)) { lesson in
                NavigationLink(destination: LessonDetailView(lesson: lesson)) {
                    QuizCard(lesson: lesson)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

// Featured Lesson Card
struct FeaturedLessonCard: View {
    let title: String
    let emoji: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Spacer()
                Button(action: {}) {
                    Image(systemName: "heart")
                        .foregroundColor(.white)
                }
            }

            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
                .lineLimit(2)

            Spacer()

            HStack {
                Spacer()
                Text(emoji)
                    .font(.system(size: 36))
            }
        }
        .frame(width: 140, height: 160)
        .padding(16)
        .background(color)
        .cornerRadius(20)
    }
}

// Small Lesson Card
struct SmallLessonCard: View {
    let emoji: String
    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(emoji)
                .font(.system(size: 32))

            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .lineLimit(2)

            Text(subtitle)
                .font(.system(size: 12))
                .foregroundColor(Color(.systemGray))
                .lineLimit(2)

            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 140)
        .padding(16)
        .background(Color(.systemGray6))
        .cornerRadius(16)
    }
}

// Quiz Card with colored theme
struct QuizCard: View {
    @EnvironmentObject var userViewModel: UserViewModel
    let lesson: Lesson

    var progress: LessonProgress? {
        userViewModel.getLessonProgress(for: lesson.id)
    }

    var body: some View {
        HStack(spacing: 12) {
            // Left side
            HStack(spacing: 12) {
                // Icon
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.black.opacity(0.1))
                    .frame(width: 48, height: 48)
                    .overlay(
                        Text(lesson.icon)
                            .font(.system(size: 24))
                    )

                // Info
                VStack(alignment: .leading, spacing: 8) {
                    Text("Quiz")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.9))

                    Text(lesson.title)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .lineLimit(2)

                    HStack(spacing: 8) {
                        HStack(spacing: 4) {
                            Text("\(lesson.estimatedMinutes) minutes")
                                .font(.system(size: 11, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color.white.opacity(0.25))
                        .cornerRadius(12)

                        HStack(spacing: 4) {
                            Text("10 questions")
                                .font(.system(size: 11, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color.white.opacity(0.25))
                        .cornerRadius(12)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.white.opacity(0.3))
                            .frame(height: 4)
                            .overlay(
                                GeometryReader { geometry in
                                    RoundedRectangle(cornerRadius: 2)
                                        .fill(Color.white)
                                        .frame(width: geometry.size.width * 0.8)
                                }
                            )

                        HStack {
                            Text("Lesson 3 of 5")
                                .font(.system(size: 11))
                                .foregroundColor(.white.opacity(0.9))

                            Spacer()

                            Text("80% Completed")
                                .font(.system(size: 11))
                                .foregroundColor(.white.opacity(0.9))
                        }
                    }
                }
            }

            Spacer()

            // Score box
            VStack(spacing: 4) {
                Text("7/10")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
                Text("Your Score")
                    .font(.system(size: 11))
                    .foregroundColor(Color(.systemGray))
            }
            .padding(16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .padding(16)
        .background(
            LinearGradient(
                colors: [categoryColor, categoryColor.opacity(0.8)],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
    }

    var categoryColor: Color {
        switch lesson.category.color {
        case "blue": return .blue
        case "green": return Color(red: 34/255, green: 197/255, blue: 94/255)
        case "orange": return Color(red: 249/255, green: 115/255, blue: 22/255)
        case "purple": return Color(red: 139/255, green: 92/255, blue: 246/255)
        case "pink": return .pink
        case "cyan": return .cyan
        case "indigo": return .indigo
        case "red": return .red
        case "teal": return .teal
        case "yellow": return .yellow
        case "mint": return .mint
        default: return Color(red: 249/255, green: 115/255, blue: 22/255)
        }
    }
}
