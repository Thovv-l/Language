# Quick Start Guide

Get your language learning app running in 5 minutes!

## Option 1: Swift Playgrounds (iPad/Mac - Fastest)

1. Open **Swift Playgrounds** app on iPad or Mac
2. Create a new **App** project
3. Copy all the Swift files from this repository into your project
4. Run the app!

## Option 2: Xcode (Full Development)

### Step 1: Create Project (2 minutes)
```bash
1. Open Xcode
2. File > New > Project
3. Choose: iOS > App
4. Settings:
   - Name: LanguageApp
   - Interface: SwiftUI
   - Language: Swift
5. Save anywhere you like
```

### Step 2: Add Files (2 minutes)
```bash
# Delete the default files Xcode created
1. Delete ContentView.swift
2. Delete the auto-generated LanguageAppApp.swift

# Add our files
3. Drag the entire LanguageApp folder from this repo into Xcode
4. Check "Copy items if needed"
5. Click Add
```

### Step 3: Run! (1 minute)
```bash
1. Select iPhone 14 Pro simulator (or any iPhone)
2. Click the Play button (or Cmd+R)
3. Wait for build...
4. App launches!
```

## Folder Structure to Copy

Copy these folders/files into your Xcode project:

```
LanguageApp/
├── LanguageApp.swift          ← Main entry point
├── Models/                    ← All 4 model files
│   ├── Language.swift
│   ├── Exercise.swift
│   ├── Lesson.swift
│   └── User.swift
├── Views/                     ← All view files
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
├── ViewModels/                ← State management
│   ├── UserViewModel.swift
│   └── LessonViewModel.swift
└── Data/                      ← Lesson content
    └── LessonContent.swift
```

## First Launch Experience

When you first run the app, you'll:

1. **See the welcome screen** 🌍
   - Tap "Get Started"

2. **Choose your native language**
   - Select the language you speak (e.g., English)

3. **Choose what to learn**
   - Select the language you want to learn (e.g., Spanish)

4. **Start learning!**
   - Browse lessons
   - Start with "Essential Words" under Basics
   - Complete exercises
   - Earn XP and build your streak!

## Testing the App

Try these scenarios:

### Test 1: Complete Your First Lesson
1. Start the app
2. Select English → Spanish (or any pair)
3. Tap "Essential Words" lesson
4. Complete all exercises
5. See your results and XP!

### Test 2: Build a Streak
1. Complete a lesson
2. Close the app
3. Open it again (same day)
4. Notice your streak increased!

### Test 3: Browse All Languages
1. Complete onboarding
2. Go to Profile tab
3. Check your stats
4. Tap "Change Languages"
5. Switch to a different language pair

### Test 4: Earn Achievements
1. Complete your first lesson → "First Steps" badge
2. Complete 5 lessons → "Getting Started" badge
3. Get 95%+ score → "Perfectionist" badge

## Troubleshooting

### Build Errors?
- **"Cannot find type"** → Make sure all files are added to target
- **"No such module"** → Clean build folder (Shift+Cmd+K), rebuild
- **Missing files** → Verify all .swift files are in the project

### App Crashes?
- **On launch** → Check that @main is in LanguageApp.swift
- **During lessons** → Verify LessonContent.swift is included
- **On profile** → Make sure UserViewModel is initialized

### No Content Showing?
- Check that LessonContent.swift has all translations
- Verify the language pair is set correctly
- Try resetting the simulator

### Reset Everything
```bash
# In Simulator:
1. Device > Erase All Content and Settings
2. Relaunch the app
3. Start fresh!
```

## Customization Quick Tips

### Change App Colors
```swift
// In HomeView.swift, change gradient:
LinearGradient(
    colors: [Color.purple.opacity(0.15), Color.pink.opacity(0.1)], // ← Change these!
    startPoint: .topLeading,
    endPoint: .bottomTrailing
)
```

### Add More Phrases
```swift
// In LessonContent.swift, add to translations:
"Your new phrase": [
    "pt-BR": "Sua nova frase",
    "es": "Tu nueva frase",
    "fr": "Votre nouvelle phrase",
    "nl": "Uw nieuwe zin"
]
```

### Change Daily Goal Default
```swift
// In User.swift, change:
var dailyGoal: Int = 10  // ← Change to any number of minutes
```

## App Architecture at a Glance

```
User Opens App
    ↓
Is language pair set?
    ├─ No → Show Onboarding
    └─ Yes → Show Home
             ↓
        Browse Lessons
             ↓
        Start Lesson
             ↓
        Complete Exercises
             ↓
        View Results
             ↓
        Earn XP & Achievements
             ↓
        Update Profile
```

## Minimum Requirements

- **Xcode:** 14.0+
- **iOS:** 15.0+
- **Mac:** macOS 12.0+ (for Xcode)
- **Disk Space:** ~50MB for project
- **Time:** 5 minutes setup

## What You Get

- ✅ 5 fully supported languages
- ✅ 20 language pair combinations
- ✅ 11 lessons with real-world phrases
- ✅ 60+ practical phrases
- ✅ Multiple exercise types
- ✅ XP and leveling system
- ✅ Streak tracking
- ✅ Achievement badges
- ✅ Progress persistence
- ✅ Beautiful modern UI
- ✅ Completely offline

## Next Steps

After getting it running:

1. **Try all lesson types** - Experience different categories
2. **Test different languages** - Switch language pairs
3. **Complete achievements** - Unlock all badges
4. **Customize it** - Make it your own!
5. **Add content** - Create more lessons
6. **Share feedback** - Tell us what you think!

## Support

**Need help?**
- Check SETUP.md for detailed instructions
- Read FEATURES.md for full feature list
- Review the code comments
- Test in iOS Simulator first

**Want to contribute?**
- Add more languages
- Create more lessons
- Improve UI/UX
- Fix bugs
- Add features

---

**Ready? Let's start learning! 🚀**

1. Open Xcode
2. Create new project
3. Add files
4. Run!
5. Learn a language!

**That's it! Have fun! 🌍📱**
