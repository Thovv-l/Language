import Foundation

enum LessonCategory: String, Codable, CaseIterable {
    case basics = "Basics"
    case greetings = "Greetings"
    case food = "Food & Dining"
    case travel = "Travel"
    case shopping = "Shopping"
    case directions = "Directions"
    case accommodation = "Accommodation"
    case emergencies = "Emergencies"
    case conversation = "Conversation"
    case numbers = "Numbers & Time"
    case weather = "Weather"
    case culture = "Culture"

    var icon: String {
        switch self {
        case .basics: return "book.fill"
        case .greetings: return "hand.wave.fill"
        case .food: return "fork.knife"
        case .travel: return "airplane"
        case .shopping: return "cart.fill"
        case .directions: return "map.fill"
        case .accommodation: return "bed.double.fill"
        case .emergencies: return "cross.case.fill"
        case .conversation: return "bubble.left.and.bubble.right.fill"
        case .numbers: return "clock.fill"
        case .weather: return "cloud.sun.fill"
        case .culture: return "globe"
        }
    }

    var color: String {
        switch self {
        case .basics: return "blue"
        case .greetings: return "green"
        case .food: return "orange"
        case .travel: return "purple"
        case .shopping: return "pink"
        case .directions: return "cyan"
        case .accommodation: return "indigo"
        case .emergencies: return "red"
        case .conversation: return "teal"
        case .numbers: return "yellow"
        case .weather: return "mint"
        case .culture: return "brown"
        }
    }
}

enum DifficultyLevel: String, Codable {
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
}

struct Lesson: Identifiable, Codable {
    let id: UUID
    let title: String
    let category: LessonCategory
    let level: DifficultyLevel
    let description: String
    let exercises: [Exercise]
    let xpReward: Int
    let estimatedMinutes: Int
    var isLocked: Bool

    init(
        id: UUID = UUID(),
        title: String,
        category: LessonCategory,
        level: DifficultyLevel,
        description: String,
        exercises: [Exercise],
        xpReward: Int = 10,
        estimatedMinutes: Int = 5,
        isLocked: Bool = false
    ) {
        self.id = id
        self.title = title
        self.category = category
        self.level = level
        self.description = description
        self.exercises = exercises
        self.xpReward = xpReward
        self.estimatedMinutes = estimatedMinutes
        self.isLocked = isLocked
    }
}

struct LessonProgress: Codable {
    let lessonId: UUID
    var isCompleted: Bool
    var score: Double // 0.0 to 1.0
    var attempts: Int
    var lastAttemptDate: Date?
    var stars: Int // 0-3 stars based on performance

    init(lessonId: UUID, isCompleted: Bool = false, score: Double = 0.0, attempts: Int = 0, lastAttemptDate: Date? = nil, stars: Int = 0) {
        self.lessonId = lessonId
        self.isCompleted = isCompleted
        self.score = score
        self.attempts = attempts
        self.lastAttemptDate = lastAttemptDate
        self.stars = stars
    }
}
