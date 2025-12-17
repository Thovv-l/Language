import SwiftUI

struct ExerciseView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject private var viewModel: LessonViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var showResults = false

    init(lesson: Lesson) {
        _viewModel = StateObject(wrappedValue: LessonViewModel(lesson: lesson))
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(red: 34/255, green: 197/255, blue: 94/255), Color(red: 22/255, green: 163/255, blue: 74/255)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {
                // Top bar with back button and hearts
                topBar

                if viewModel.isLessonComplete {
                    // Show results
                    LessonResultsView(
                        lesson: viewModel.lesson,
                        score: viewModel.score,
                        correctAnswers: viewModel.correctAnswersCount,
                        totalExercises: viewModel.totalExercises,
                        onContinue: {
                            // Save progress
                            userViewModel.completeLesson(
                                lessonId: viewModel.lesson.id,
                                score: viewModel.score
                            )
                            presentationMode.wrappedValue.dismiss()
                        },
                        onRetry: {
                            viewModel.reset()
                        }
                    )
                } else {
                    VStack(spacing: 0) {
                        // Timer bar
                        timerBar

                        // White question card
                        ScrollView {
                            VStack(spacing: 20) {
                                if let exercise = viewModel.currentExercise {
                                    ExerciseContentView(
                                        exercise: exercise,
                                        userAnswer: $viewModel.userAnswer,
                                        selectedOption: $viewModel.selectedOption,
                                        showFeedback: viewModel.showFeedback,
                                        isCorrect: viewModel.isCorrect,
                                        currentIndex: viewModel.currentExerciseIndex,
                                        totalExercises: viewModel.totalExercises
                                    )
                                }
                            }
                            .padding(20)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 32)
                                .fill(Color.white)
                        )

                        // Bottom button
                        bottomButton
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }

    var topBar: some View {
        HStack {
            // Back button
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Circle()
                    .fill(Color.white.opacity(0.3))
                    .frame(width: 40, height: 40)
                    .overlay(
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                    )
            }

            Spacer()

            Text("Quiz")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)

            Spacer()

            // Hearts container
            HStack(spacing: 6) {
                Text("❤️")
                    .font(.system(size: 18))
                Text("10")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(.darkGray))
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color.white)
            .cornerRadius(20)
        }
        .padding()
    }

    var timerBar: some View {
        HStack(spacing: 12) {
            // Timer display
            HStack {
                Text("00:20")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(.darkGray))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .background(Color.white.opacity(0.9))
            .cornerRadius(16)

            // Timer icon
            Text("⏱️")
                .font(.system(size: 20))
        }
        .padding(.horizontal)
        .padding(.bottom, 16)
    }

    var bottomButton: some View {
        VStack(spacing: 0) {
            if !viewModel.showFeedback {
                Button(action: {
                    viewModel.submitAnswer()
                }) {
                    Text("Check Answer")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color(.darkGray))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(canSubmit ? Color.white : Color.white.opacity(0.5))
                        .cornerRadius(16)
                }
                .disabled(!canSubmit)
                .padding()
            } else {
                Button(action: {
                    viewModel.nextExercise()
                }) {
                    Text("Next Question")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color(.darkGray))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(16)
                }
                .padding()
            }

            // Feedback banner at bottom
            if viewModel.showFeedback {
                HStack {
                    Text(viewModel.isCorrect ? "✓ Correct!" : "✕ Not quite")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)

                    Spacer()

                    if !viewModel.isCorrect, let exercise = viewModel.currentExercise {
                        Text("Correct answer: \(exercise.correctAnswer)")
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.9))
                    }
                }
                .padding()
                .background(viewModel.isCorrect ? Color(red: 34/255, green: 197/255, blue: 94/255) : Color(red: 239/255, green: 68/255, blue: 68/255))
            }
        }
    }

    var canSubmit: Bool {
        if let exercise = viewModel.currentExercise {
            switch exercise.type {
            case .multipleChoice:
                return viewModel.selectedOption != nil
            case .translation, .fillInBlank, .listening:
                return !viewModel.userAnswer.isEmpty
            default:
                return true
            }
        }
        return false
    }
}

struct ExerciseContentView: View {
    let exercise: Exercise
    @Binding var userAnswer: String
    @Binding var selectedOption: String?
    let showFeedback: Bool
    let isCorrect: Bool
    let currentIndex: Int
    let totalExercises: Int

    var body: some View {
        VStack(spacing: 20) {
            // Question header
            HStack {
                Text("Question \(currentIndex + 1)/\(totalExercises)")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(.systemGray))

                Spacer()

                HStack(spacing: 6) {
                    Text("🇺🇸")
                        .font(.system(size: 16))
                    Text("English (USA)")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color(.systemGray))
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .background(Color(.systemGray6))
                .cornerRadius(12)
            }

            // Category label and Question
            VStack(alignment: .leading, spacing: 8) {
                Text(exercise.category ?? "Vocabulary")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(red: 34/255, green: 197/255, blue: 94/255))

                Text(exercise.question)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color(.darkGray))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            // Answer input based on exercise type
            switch exercise.type {
            case .multipleChoice:
                multipleChoiceOptions
            case .translation, .fillInBlank:
                translationInput
            case .listening:
                listeningExercise
            default:
                Text("Exercise type coming soon!")
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
    }

    var multipleChoiceOptions: some View {
        VStack(spacing: 12) {
            if let options = exercise.options {
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        if !showFeedback {
                            selectedOption = option
                        }
                    }) {
                        HStack {
                            Text(option)
                                .font(.system(size: 18))
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.leading)

                            Spacer()

                            if showFeedback {
                                if option == exercise.correctAnswer {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                } else if option == selectedOption {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.red)
                                }
                            } else if selectedOption == option {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(getOptionBackground(for: option))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(getOptionBorder(for: option), lineWidth: 2)
                        )
                    }
                    .disabled(showFeedback)
                }
            }
        }
    }

    func getOptionBackground(for option: String) -> Color {
        if showFeedback {
            if option == exercise.correctAnswer {
                return Color(red: 209/255, green: 250/255, blue: 229/255)
            } else if option == selectedOption {
                return Color(red: 254/255, green: 226/255, blue: 226/255)
            }
        } else if selectedOption == option {
            return Color(red: 255/255, green: 237/255, blue: 213/255)
        }
        return Color(.systemGray6)
    }

    func getOptionBorder(for option: String) -> Color {
        if showFeedback {
            if option == exercise.correctAnswer {
                return Color(red: 34/255, green: 197/255, blue: 94/255)
            } else if option == selectedOption {
                return Color(red: 239/255, green: 68/255, blue: 68/255)
            }
        } else if selectedOption == option {
            return Color(red: 251/255, green: 146/255, blue: 60/255)
        }
        return Color(.systemGray5)
    }

    var translationInput: some View {
        VStack(spacing: 16) {
            TextField("Type your answer...", text: $userAnswer)
                .font(.system(size: 18))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.9))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.blue.opacity(0.3), lineWidth: 2)
                )
                .disabled(showFeedback)
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
    }

    var listeningExercise: some View {
        VStack(spacing: 20) {
            // Audio playback button
            Button(action: {
                // Play audio (placeholder)
            }) {
                VStack(spacing: 12) {
                    Image(systemName: "speaker.wave.3.fill")
                        .font(.system(size: 48))
                        .foregroundColor(.blue)

                    Text("Tap to listen")
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                }
                .padding(40)
                .background(
                    Circle()
                        .fill(Color.white.opacity(0.9))
                )
            }

            TextField("Type what you hear...", text: $userAnswer)
                .font(.system(size: 18))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.9))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.blue.opacity(0.3), lineWidth: 2)
                )
                .disabled(showFeedback)
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
    }
}

struct LessonResultsView: View {
    let lesson: Lesson
    let score: Double
    let correctAnswers: Int
    let totalExercises: Int
    let onContinue: () -> Void
    let onRetry: () -> Void

    var stars: Int {
        if score >= 0.95 { return 3 }
        else if score >= 0.8 { return 2 }
        else if score >= 0.6 { return 1 }
        return 0
    }

    var xpEarned: Int {
        Int(Double(lesson.xpReward) * score)
    }

    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            // Trophy or result icon
            Text(stars >= 2 ? "🏆" : stars >= 1 ? "👍" : "💪")
                .font(.system(size: 80))

            // Title
            Text(stars >= 2 ? "Excellent!" : stars >= 1 ? "Good job!" : "Keep practicing!")
                .font(.system(size: 36, weight: .bold))

            // Score
            Text("\(Int(score * 100))%")
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(.blue)

            // Stars
            HStack(spacing: 12) {
                ForEach(0..<3) { index in
                    Image(systemName: index < stars ? "star.fill" : "star")
                        .font(.system(size: 36))
                        .foregroundColor(.yellow)
                }
            }

            // Stats
            VStack(spacing: 16) {
                HStack {
                    Text("Correct Answers")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(correctAnswers)/\(totalExercises)")
                        .fontWeight(.semibold)
                }

                HStack {
                    Text("XP Earned")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("+\(xpEarned)")
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.9))
            )

            Spacer()

            // Buttons
            VStack(spacing: 12) {
                Button(action: onContinue) {
                    Text("Continue")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(16)
                }

                if score < 1.0 {
                    Button(action: onRetry) {
                        Text("Practice Again")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    }
                }
            }
        }
        .padding()
    }
}
