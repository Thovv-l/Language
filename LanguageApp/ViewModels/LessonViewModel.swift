import Foundation
import Combine

class LessonViewModel: ObservableObject {
    @Published var currentExerciseIndex: Int = 0
    @Published var userAnswer: String = ""
    @Published var selectedOption: String? = nil
    @Published var showFeedback: Bool = false
    @Published var isCorrect: Bool = false
    @Published var exerciseResults: [ExerciseResult] = []
    @Published var isLessonComplete: Bool = false

    let lesson: Lesson
    var currentExercise: Exercise? {
        guard currentExerciseIndex < lesson.exercises.count else { return nil }
        return lesson.exercises[currentExerciseIndex]
    }

    var progress: Double {
        guard !lesson.exercises.isEmpty else { return 0 }
        return Double(currentExerciseIndex) / Double(lesson.exercises.count)
    }

    var correctAnswersCount: Int {
        exerciseResults.filter { $0.isCorrect }.count
    }

    var totalExercises: Int {
        lesson.exercises.count
    }

    var score: Double {
        guard totalExercises > 0 else { return 0 }
        return Double(correctAnswersCount) / Double(totalExercises)
    }

    init(lesson: Lesson) {
        self.lesson = lesson
    }

    func submitAnswer() {
        guard let exercise = currentExercise else { return }

        let answer: String
        switch exercise.type {
        case .multipleChoice:
            answer = selectedOption ?? ""
        case .translation, .fillInBlank:
            answer = userAnswer.trimmingCharacters(in: .whitespacesAndNewlines)
        case .listening:
            answer = userAnswer.trimmingCharacters(in: .whitespacesAndNewlines)
        case .speaking:
            answer = "Recorded" // Placeholder for speaking exercises
        case .matchPairs:
            answer = userAnswer
        }

        let correct = checkAnswer(answer: answer, correctAnswer: exercise.correctAnswer)

        let result = ExerciseResult(
            exerciseId: exercise.id,
            isCorrect: correct,
            userAnswer: answer,
            correctAnswer: exercise.correctAnswer,
            timestamp: Date()
        )

        exerciseResults.append(result)
        isCorrect = correct
        showFeedback = true
    }

    private func checkAnswer(answer: String, correctAnswer: String) -> Bool {
        // Case-insensitive comparison, trimmed
        let normalizedAnswer = answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        let normalizedCorrect = correctAnswer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // Allow for minor punctuation differences
        let answerNoPunctuation = normalizedAnswer.filter { $0.isLetter || $0.isWhitespace }
        let correctNoPunctuation = normalizedCorrect.filter { $0.isLetter || $0.isWhitespace }

        return answerNoPunctuation == correctNoPunctuation
    }

    func nextExercise() {
        showFeedback = false
        userAnswer = ""
        selectedOption = nil

        if currentExerciseIndex < lesson.exercises.count - 1 {
            currentExerciseIndex += 1
        } else {
            isLessonComplete = true
        }
    }

    func reset() {
        currentExerciseIndex = 0
        userAnswer = ""
        selectedOption = nil
        showFeedback = false
        isCorrect = false
        exerciseResults = []
        isLessonComplete = false
    }
}
