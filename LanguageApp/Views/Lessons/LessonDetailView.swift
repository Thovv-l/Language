import SwiftUI

struct LessonDetailView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Environment(\.presentationMode) var presentationMode
    let lesson: Lesson
    @State private var showExercise = false

    var progress: LessonProgress? {
        userViewModel.getLessonProgress(for: lesson.id)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Lesson icon and title
                VStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .fill(categoryColor.opacity(0.2))
                            .frame(width: 100, height: 100)

                        Image(systemName: lesson.category.icon)
                            .font(.system(size: 48))
                            .foregroundColor(categoryColor)
                    }

                    Text(lesson.title)
                        .font(.system(size: 32, weight: .bold))
                        .multilineTextAlignment(.center)

                    Text(lesson.description)
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 30)

                // Lesson info cards
                HStack(spacing: 16) {
                    InfoCard(icon: "clock.fill", title: "\(lesson.estimatedMinutes) min", color: Color(red: 34/255, green: 197/255, blue: 94/255))
                    InfoCard(icon: "star.fill", title: "+\(lesson.xpReward) XP", color: .yellow)
                    InfoCard(icon: "text.book.closed.fill", title: "\(lesson.exercises.count) exercises", color: categoryColor)
                }

                // Previous attempts
                if let progress = progress, progress.isCompleted {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Your Best Score")
                            .font(.system(size: 18, weight: .semibold))

                        HStack {
                            // Stars
                            HStack(spacing: 6) {
                                ForEach(0..<3) { index in
                                    Image(systemName: index < progress.stars ? "star.fill" : "star")
                                        .font(.system(size: 24))
                                        .foregroundColor(.yellow)
                                }
                            }

                            Spacer()

                            Text("\(Int(progress.score * 100))%")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(Color(red: 34/255, green: 197/255, blue: 94/255))
                        }

                        Text("Attempts: \(progress.attempts)")
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                    }
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                            .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
                    )
                }

                // Start button
                Button(action: {
                    showExercise = true
                }) {
                    HStack {
                        Image(systemName: progress?.isCompleted ?? false ? "arrow.clockwise" : "play.fill")
                        Text(progress?.isCompleted ?? false ? "Practice Again" : "Start Lesson")
                    }
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [Color(red: 34/255, green: 197/255, blue: 94/255), Color(red: 22/255, green: 163/255, blue: 74/255)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(16)
                }
                .padding(.top, 8)
            }
            .padding()
        }
        .background(Color.white)
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $showExercise) {
            ExerciseView(lesson: lesson)
        }
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

struct InfoCard: View {
    let icon: String
    let title: String
    let color: Color

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(color)

            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
        )
    }
}
