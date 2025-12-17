import Foundation

struct User: Codable {
    var id: UUID
    var name: String
    var languagePair: LanguagePair?
    var currentStreak: Int
    var longestStreak: Int
    var totalXP: Int
    var level: Int
    var dailyGoal: Int // minutes per day
    var lastActiveDate: Date?
    var joinDate: Date
    var achievements: [Achievement]
    var lessonProgress: [UUID: LessonProgress] // lessonId -> progress

    init(
        id: UUID = UUID(),
        name: String = "Learner",
        languagePair: LanguagePair? = nil,
        currentStreak: Int = 0,
        longestStreak: Int = 0,
        totalXP: Int = 0,
        level: Int = 1,
        dailyGoal: Int = 10,
        lastActiveDate: Date? = nil,
        joinDate: Date = Date(),
        achievements: [Achievement] = [],
        lessonProgress: [UUID: LessonProgress] = [:]
    ) {
        self.id = id
        self.name = name
        self.languagePair = languagePair
        self.currentStreak = currentStreak
        self.longestStreak = longestStreak
        self.totalXP = totalXP
        self.level = level
        self.dailyGoal = dailyGoal
        self.lastActiveDate = lastActiveDate
        self.joinDate = joinDate
        self.achievements = achievements
        self.lessonProgress = lessonProgress
    }

    var xpToNextLevel: Int {
        return level * 100
    }

    var currentLevelProgress: Double {
        let xpInCurrentLevel = totalXP % xpToNextLevel
        return Double(xpInCurrentLevel) / Double(xpToNextLevel)
    }

    mutating func addXP(_ amount: Int) {
        totalXP += amount
        updateLevel()
    }

    private mutating func updateLevel() {
        let newLevel = (totalXP / 100) + 1
        if newLevel > level {
            level = newLevel
        }
    }

    mutating func updateStreak() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())

        if let lastActive = lastActiveDate {
            let lastActiveDay = calendar.startOfDay(for: lastActive)
            let daysDifference = calendar.dateComponents([.day], from: lastActiveDay, to: today).day ?? 0

            if daysDifference == 1 {
                // Continue streak
                currentStreak += 1
                if currentStreak > longestStreak {
                    longestStreak = currentStreak
                }
            } else if daysDifference > 1 {
                // Streak broken
                currentStreak = 1
            }
            // If daysDifference == 0, already counted today
        } else {
            // First day
            currentStreak = 1
            longestStreak = 1
        }

        lastActiveDate = Date()
    }
}

struct Achievement: Identifiable, Codable {
    let id: UUID
    let title: String
    let description: String
    let icon: String
    let dateEarned: Date
    let category: AchievementCategory

    init(
        id: UUID = UUID(),
        title: String,
        description: String,
        icon: String,
        dateEarned: Date = Date(),
        category: AchievementCategory
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.icon = icon
        self.dateEarned = dateEarned
        self.category = category
    }
}

enum AchievementCategory: String, Codable {
    case streak = "Streak"
    case lessons = "Lessons"
    case perfect = "Perfect Score"
    case dedication = "Dedication"
    case milestone = "Milestone"
}
