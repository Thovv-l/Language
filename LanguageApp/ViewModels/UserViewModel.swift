import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var user: User
    @Published var availableLessons: [Lesson] = []

    private let userDefaultsKey = "savedUser"

    init() {
        // Load user from UserDefaults or create new user
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decodedUser = try? JSONDecoder().decode(User.self, from: savedData) {
            self.user = decodedUser
        } else {
            self.user = User()
        }

        loadLessons()
    }

    func saveUser() {
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }

    func setLanguagePair(native: SupportedLanguage, learning: SupportedLanguage) {
        user.languagePair = LanguagePair(native: native, learning: learning)
        loadLessons()
        saveUser()
    }

    func loadLessons() {
        guard let languagePair = user.languagePair else {
            availableLessons = []
            return
        }

        availableLessons = LessonContent.getLessons(for: languagePair)
    }

    func completeLesson(lessonId: UUID, score: Double) {
        let stars = calculateStars(from: score)
        let progress = LessonProgress(
            lessonId: lessonId,
            isCompleted: true,
            score: score,
            attempts: (user.lessonProgress[lessonId]?.attempts ?? 0) + 1,
            lastAttemptDate: Date(),
            stars: stars
        )

        user.lessonProgress[lessonId] = progress

        // Award XP
        if let lesson = availableLessons.first(where: { $0.id == lessonId }) {
            let xpEarned = Int(Double(lesson.xpReward) * score)
            user.addXP(xpEarned)
        }

        // Update streak
        user.updateStreak()

        // Check for achievements
        checkAndAwardAchievements()

        saveUser()
    }

    private func calculateStars(from score: Double) -> Int {
        if score >= 0.95 {
            return 3
        } else if score >= 0.8 {
            return 2
        } else if score >= 0.6 {
            return 1
        }
        return 0
    }

    private func checkAndAwardAchievements() {
        // First lesson completed
        if user.lessonProgress.values.filter({ $0.isCompleted }).count == 1 {
            awardAchievement(
                title: "First Steps",
                description: "Completed your first lesson",
                icon: "star.fill",
                category: .lessons
            )
        }

        // 5 lessons completed
        if user.lessonProgress.values.filter({ $0.isCompleted }).count == 5 {
            awardAchievement(
                title: "Getting Started",
                description: "Completed 5 lessons",
                icon: "star.circle.fill",
                category: .lessons
            )
        }

        // 7-day streak
        if user.currentStreak == 7 {
            awardAchievement(
                title: "Week Warrior",
                description: "Maintained a 7-day streak",
                icon: "flame.fill",
                category: .streak
            )
        }

        // Perfect score
        if user.lessonProgress.values.contains(where: { $0.score == 1.0 }) {
            let hasPerfectAchievement = user.achievements.contains { $0.title == "Perfectionist" }
            if !hasPerfectAchievement {
                awardAchievement(
                    title: "Perfectionist",
                    description: "Got a perfect score on a lesson",
                    icon: "checkmark.seal.fill",
                    category: .perfect
                )
            }
        }

        // Level 5
        if user.level == 5 {
            let hasLevel5Achievement = user.achievements.contains { $0.title == "Rising Star" }
            if !hasLevel5Achievement {
                awardAchievement(
                    title: "Rising Star",
                    description: "Reached level 5",
                    icon: "star.leadinghalf.filled",
                    category: .milestone
                )
            }
        }
    }

    private func awardAchievement(title: String, description: String, icon: String, category: AchievementCategory) {
        let achievement = Achievement(
            title: title,
            description: description,
            icon: icon,
            category: category
        )

        // Check if already has this achievement
        if !user.achievements.contains(where: { $0.title == title }) {
            user.achievements.append(achievement)
        }
    }

    func getLessonProgress(for lessonId: UUID) -> LessonProgress? {
        return user.lessonProgress[lessonId]
    }

    func resetProgress() {
        user.lessonProgress.removeAll()
        user.totalXP = 0
        user.level = 1
        user.currentStreak = 0
        user.achievements.removeAll()
        saveUser()
    }
}
