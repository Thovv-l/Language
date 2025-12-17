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
                colors: [Color.blue.opacity(0.15), Color.cyan.opacity(0.1)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {
                // Top bar with progress and close button
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
                    // Show current exercise
                    ScrollView {
                        VStack(spacing: 24) {
                            if let exercise = viewModel.currentExercise {
                                ExerciseContentView(
                                    exercise: exercise,
                                    userAnswer: $viewModel.userAnswer,
                                    selectedOption: $viewModel.selectedOption,
                                    showFeedback: viewModel.showFeedback,
                                    isCorrect: viewModel.isCorrect
                                )
                            }
                        }
                        .padding()
                    }

                    // Bottom button
                    bottomButton
                }
            }
        }
        .navigationBarHidden(true)
    }

    var topBar: some View {
        VStack(spacing: 12) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.primary)
                        .padding(10)
                        .background(Circle().fill(Color.white.opacity(0.9)))
                }

                Spacer()

                Text("\(viewModel.currentExerciseIndex + 1) / \(viewModel.totalExercises)")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.secondary)
            }

            // Progress bar
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 8)

                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green)
                        .frame(width: geometry.size.width * viewModel.progress, height: 8)
                        .animation(.easeInOut, value: viewModel.progress)
                }
            }
            .frame(height: 8)
        }
        .padding()
    }

    var bottomButton: some View {
        VStack(spacing: 0) {
            Divider()

            if viewModel.showFeedback {
                // Feedback banner
                HStack {
                    Image(systemName: viewModel.isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(viewModel.isCorrect ? .green : .red)

                    Text(viewModel.isCorrect ? "Correct!" : "Not quite")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(viewModel.isCorrect ? .green : .red)

                    if !viewModel.isCorrect, let exercise = viewModel.currentExercise {
                        Spacer()
                        Text(exercise.correctAnswer)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.primary)
                    }
                }
                .padding()
                .background((viewModel.isCorrect ? Color.green : Color.red).opacity(0.1))

                Button(action: {
                    viewModel.nextExercise()
                }) {
                    Text("Continue")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.isCorrect ? Color.green : Color.orange)
                        .cornerRadius(16)
                }
                .padding()
            } else {
                Button(action: {
                    viewModel.submitAnswer()
                }) {
                    Text("Check")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(canSubmit ? Color.blue : Color.gray)
                        .cornerRadius(16)
                }
                .disabled(!canSubmit)
                .padding()
            }
        }
        .background(Color.white.opacity(0.95))
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

    var body: some View {
        VStack(spacing: 24) {
            // Question
            VStack(spacing: 12) {
                Text(exercise.question)
                    .font(.system(size: 24, weight: .semibold))
                    .multilineTextAlignment(.center)

                if let hint = exercise.hint, !showFeedback {
                    Text(hint)
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                        .italic()
                }
            }
            .padding(.top, 30)

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
                return Color.green.opacity(0.1)
            } else if option == selectedOption {
                return Color.red.opacity(0.1)
            }
        } else if selectedOption == option {
            return Color.blue.opacity(0.1)
        }
        return Color.white.opacity(0.9)
    }

    func getOptionBorder(for option: String) -> Color {
        if showFeedback {
            if option == exercise.correctAnswer {
                return Color.green
            } else if option == selectedOption {
                return Color.red
            }
        } else if selectedOption == option {
            return Color.blue
        }
        return Color.clear
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
