# Setup Guide - Language Learning App

## Prerequisites

- macOS with Xcode 14.0 or later
- iOS 15.0+ deployment target
- Basic knowledge of SwiftUI

## Setting Up the Project in Xcode

Since this is a SwiftUI-based iOS app, you'll need to create an Xcode project to run it. Follow these steps:

### Step 1: Create a New Xcode Project

1. Open Xcode
2. Select **File > New > Project**
3. Choose **iOS > App** template
4. Click **Next**
5. Configure your project:
   - **Product Name**: `LanguageApp`
   - **Team**: Select your development team (or None for simulator only)
   - **Organization Identifier**: com.yourname (or any identifier)
   - **Interface**: SwiftUI
   - **Language**: Swift
   - **Storage**: None (we use UserDefaults)
   - **Include Tests**: Optional
6. Click **Next** and choose a location to save the project

### Step 2: Add the Source Files

1. In Xcode's Project Navigator, delete the default `ContentView.swift` and `LanguageAppApp.swift` files that were auto-generated
2. Right-click on the `LanguageApp` folder and select **Add Files to "LanguageApp"...**
3. Navigate to the repository folder and add all the Swift files from:
   - `LanguageApp/LanguageApp.swift`
   - `LanguageApp/Models/`
   - `LanguageApp/Views/`
   - `LanguageApp/ViewModels/`
   - `LanguageApp/Data/`
4. Make sure **"Copy items if needed"** is checked
5. Click **Add**

### Alternative: Manual File Creation

If you prefer to create files manually:

1. In Xcode, right-click on the `LanguageApp` folder
2. Select **New Group** and create these folders:
   - Models
   - Views (with subfolders: Onboarding, Home, Lessons, Exercises, Profile, Components)
   - ViewModels
   - Data
3. For each Swift file in the repository:
   - Right-click on the appropriate folder
   - Select **New File > Swift File**
   - Name it appropriately
   - Copy and paste the code from the repository

### Step 3: Configure the Main App Entry Point

Ensure your `LanguageApp.swift` is set as the `@main` entry point. The file should contain:

```swift
@main
struct LanguageApp: App {
    @StateObject private var userViewModel = UserViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userViewModel)
        }
    }
}
```

### Step 4: Build and Run

1. Select a simulator or device from the scheme selector (e.g., iPhone 14 Pro)
2. Click the **Play** button or press **Cmd + R**
3. The app should build and launch on the simulator

## Project Structure

```
LanguageApp/
├── LanguageApp.swift          # App entry point
├── Models/                    # Data models
│   ├── Language.swift        # Language enums and pairs
│   ├── Exercise.swift        # Exercise types and results
│   ├── Lesson.swift          # Lesson and progress models
│   └── User.swift            # User profile and achievements
├── Views/                     # SwiftUI views
│   ├── Onboarding/
│   │   └── OnboardingView.swift
│   ├── Home/
│   │   └── HomeView.swift
│   ├── Lessons/
│   │   └── LessonDetailView.swift
│   ├── Exercises/
│   │   └── ExerciseView.swift
│   └── Profile/
│       └── ProfileView.swift
├── ViewModels/                # State management
│   ├── UserViewModel.swift
│   └── LessonViewModel.swift
└── Data/                      # Content and translations
    └── LessonContent.swift
```

## Features Implemented

### Core Features
- ✅ Language selection (5 languages: English, Portuguese, Spanish, French, Dutch)
- ✅ Bidirectional learning (any language can be native or target)
- ✅ Practical, real-world phrases (no nonsense like "the cat cuts steak")
- ✅ Multiple exercise types (multiple choice, translation, fill-in-blank, listening)
- ✅ Progress tracking and persistence
- ✅ Streak system
- ✅ XP and leveling system
- ✅ Achievement badges
- ✅ Beautiful UI inspired by modern app design

### Lessons Categories
1. **Basics** - Essential words and phrases
2. **Greetings** - Daily greetings and introductions
3. **Food & Dining** - Restaurant and food-related phrases
4. **Travel** - Transportation and travel essentials
5. **Shopping** - Shopping and payment phrases
6. **Directions** - Navigation and location phrases
7. **Accommodation** - Hotel and lodging phrases
8. **Emergencies** - Critical safety phrases
9. **Conversation** - General conversation starters
10. **Numbers & Time** - Counting and time expressions

## Customization

### Adding More Languages

1. Open `Models/Language.swift`
2. Add a new case to the `SupportedLanguage` enum
3. Add translations in `Data/LessonContent.swift`

### Adding More Lessons

1. Open `Data/LessonContent.swift`
2. Add phrases to the `translations` dictionary
3. Create a new lesson creator function
4. Add it to the `getLessons()` function

### Changing UI Colors

The app uses a gradient background and color scheme inspired by the provided designs. To customize:

1. Navigate to the view you want to modify
2. Update the `LinearGradient` or color values
3. The primary accent color is yellow (for buttons)
4. The app uses a soft blue gradient background

## Troubleshooting

### "Cannot find type in scope" errors
- Make sure all files are added to the target
- Check that file names match the class/struct names
- Verify imports are correct

### App crashes on launch
- Check that `UserViewModel` is properly initialized
- Verify `@EnvironmentObject` is passed correctly
- Make sure `LanguageApp.swift` has `@main` attribute

### Exercises not showing
- Verify `LessonContent.swift` translations are complete
- Check that the language codes match
- Ensure lesson creation functions are called

## Running on Physical Device

1. Connect your iPhone/iPad
2. In Xcode, select your device from the scheme selector
3. You may need to:
   - Enable "Developer Mode" on your device (Settings > Privacy & Security)
   - Trust your development certificate
   - Sign in with your Apple ID in Xcode (Preferences > Accounts)
4. Click Run

## Data Persistence

The app uses UserDefaults to save:
- User profile and preferences
- Language pair selection
- Lesson progress and scores
- Achievements and streaks
- XP and level

Data persists between app launches automatically.

## Next Steps / Future Enhancements

- 🎯 Add audio playback for listening exercises
- 🎯 Implement speech recognition for speaking exercises
- 🎯 Add more lesson content
- 🎯 Create a spaced repetition system
- 🎯 Add social features (friends, leaderboards)
- 🎯 Implement offline mode
- 🎯 Add dark mode support
- 🎯 Create iPad-optimized layouts
- 🎯 Add notifications for daily reminders

## Support

For issues or questions:
1. Check that you're using the correct Xcode version
2. Verify all files are properly imported
3. Clean build folder (Shift + Cmd + K) and rebuild
4. Reset the simulator if needed

## License

This is a personal learning project. Feel free to use and modify as needed.
