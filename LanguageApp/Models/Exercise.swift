import Foundation

enum ExerciseType: String, Codable {
    case multipleChoice = "Multiple Choice"
    case translation = "Translation"
    case fillInBlank = "Fill in the Blank"
    case listening = "Listening"
    case speaking = "Speaking"
    case matchPairs = "Match Pairs"
}

struct Exercise: Identifiable, Codable {
    let id: UUID
    let type: ExerciseType
    let question: String
    let correctAnswer: String
    let options: [String]? // For multiple choice
    let hint: String?
    let audioFile: String? // For listening exercises
    let translationContext: String? // Additional context

    init(
        id: UUID = UUID(),
        type: ExerciseType,
        question: String,
        correctAnswer: String,
        options: [String]? = nil,
        hint: String? = nil,
        audioFile: String? = nil,
        translationContext: String? = nil
    ) {
        self.id = id
        self.type = type
        self.question = question
        self.correctAnswer = correctAnswer
        self.options = options
        self.hint = hint
        self.audioFile = audioFile
        self.translationContext = translationContext
    }
}

struct ExerciseResult: Codable {
    let exerciseId: UUID
    let isCorrect: Bool
    let userAnswer: String
    let correctAnswer: String
    let timestamp: Date
}
