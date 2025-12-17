# 🌍 Language Learning App

> A modern, practical language learning app inspired by Duolingo, but focused on **real-world phrases** you'll actually use - no more "the cat cuts steak"!

![iOS](https://img.shields.io/badge/iOS-15.0+-blue.svg)
![Swift](https://img.shields.io/badge/Swift-5.7+-orange.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-3.0+-green.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

## ✨ Highlights

- 🗣️ **5 Languages**: English, Brazilian Portuguese, Spanish, French, Dutch
- 🔄 **20 Language Pairs**: Learn any language from any language
- 📚 **11 Practical Lessons**: Real-world scenarios only
- 🎯 **60+ Useful Phrases**: Things you'll actually say
- 🎮 **Gamification**: Streaks, XP, levels, and achievements
- 🎨 **Beautiful UI**: Modern, clean design inspired by top apps
- 💾 **Offline First**: All content available without internet
- 🆓 **Free & Open**: No ads, no subscriptions

## 🚀 Quick Start

**Ready in 5 minutes!** See [QUICKSTART.md](QUICKSTART.md)

```bash
1. Open Xcode
2. Create new iOS App project (SwiftUI)
3. Add the LanguageApp/ files
4. Run! (Cmd+R)
```

Full setup instructions: [SETUP.md](SETUP.md)

## 📱 Features

### 🎓 Learning Features
- **Multiple Exercise Types**: Multiple choice, translation, fill-in-blank, listening
- **Smart Feedback**: Instant corrections with proper answers
- **Progress Tracking**: Stars, scores, and completion stats
- **Spaced Repetition Ready**: Architecture supports future SRS

### 🎮 Gamification
- **Streak System**: Daily learning streaks with tracking
- **XP & Levels**: Earn experience points and level up
- **Achievements**: Unlock badges for milestones
- **Star Ratings**: Earn 1-3 stars per lesson based on accuracy

### 📊 Progress & Stats
- **User Profile**: Track your learning journey
- **Lesson History**: Review past performance
- **Statistics Dashboard**: Streaks, XP, completed lessons
- **Best Scores**: See your top performances

## 🌐 Supported Languages

Each language works **bidirectionally** - learn any from any!

| Language | Native | Flag |
|----------|--------|------|
| English | ✅ | 🇺🇸 |
| Brazilian Portuguese | ✅ | 🇧🇷 |
| Spanish | ✅ | 🇪🇸 |
| French | ✅ | 🇫🇷 |
| Dutch | ✅ | 🇳🇱 |

**Total**: 20 unique language pair combinations

## 📚 Lesson Categories

1. **Basics** - Yes, No, Please, Thank you
2. **Greetings** - Hello, How are you?, Introductions
3. **Food & Dining** - Ordering, menus, dietary needs
4. **Travel** - Directions, help, transportation
5. **Shopping** - Prices, payments, purchases
6. **Directions** - Navigation, getting around
7. **Accommodation** - Hotels, rooms, check-in
8. **Emergencies** - Medical, police, critical phrases
9. **Numbers & Time** - Counting, time, dates
10. **Weather** - Descriptions, small talk

See full feature list: [FEATURES.md](FEATURES.md)

## 💡 Real-World Focus

### ✅ We Teach:
- "Where is the bathroom?" - You'll need this!
- "Can I see the menu?" - Essential for dining
- "How much does it cost?" - Shopping necessity
- "I need a doctor" - Critical for emergencies
- "Hello, nice to meet you" - Real introductions

### ❌ We Don't Teach:
- "The cat cuts steak" - When would you say this?
- "My uncle's bicycle is purple" - Impractical
- "The monkey wears a hat" - Not useful

**Every phrase has real-world value!**

## 🏗️ Architecture

```
SwiftUI + MVVM
├── Models (Data structures)
├── Views (SwiftUI interfaces)
├── ViewModels (State management)
└── Data (Lesson content)
```

**Tech Stack:**
- SwiftUI for UI
- Combine for reactive programming
- UserDefaults for persistence
- MVVM architecture pattern

## 📸 Screenshots

The app features:
- Clean gradient backgrounds (blue/cyan)
- Card-based layouts
- Yellow accent buttons
- Smooth animations
- Intuitive navigation

*UI inspired by modern app design patterns*

## 🛠️ Development

### Requirements
- Xcode 14.0+
- iOS 15.0+
- macOS 12.0+ (for development)

### Project Structure
```
LanguageApp/
├── Models/           # Data models
├── Views/            # SwiftUI views
├── ViewModels/       # State management
└── Data/             # Lesson content
```

### Adding Content

**Add a new language:**
1. Edit `Models/Language.swift`
2. Add to `SupportedLanguage` enum
3. Add translations in `Data/LessonContent.swift`

**Add a new lesson:**
1. Add phrases to `translations` dictionary
2. Create lesson function in `LessonContent.swift`
3. Add to `getLessons()` method

See [SETUP.md](SETUP.md) for details.

## 🎯 Roadmap

Future enhancements:
- [ ] Audio playback for listening exercises
- [ ] Speech recognition for speaking
- [ ] More languages (German, Italian, Japanese, etc.)
- [ ] Spaced repetition system
- [ ] Social features (leaderboards)
- [ ] Dark mode
- [ ] iPad optimization
- [ ] macOS version
- [ ] Widgets
- [ ] Daily reminders

## 🤝 Contributing

Contributions welcome! Areas to help:
- Add more languages
- Create more lesson content
- Improve UI/UX
- Add features
- Fix bugs
- Write tests

## 📄 Documentation

- [QUICKSTART.md](QUICKSTART.md) - Get running in 5 minutes
- [SETUP.md](SETUP.md) - Detailed setup guide
- [FEATURES.md](FEATURES.md) - Complete feature overview

## 🙏 Acknowledgments

- Inspired by Duolingo's gamification
- UI design inspired by modern app patterns
- Focus on practical, real-world language learning

## 📝 License

MIT License - Feel free to use and modify!

## 💬 Support

Questions? Issues?
- Check the documentation
- Review the code comments
- Open an issue

---

**Ready to learn a language the practical way?** 🚀

Start with [QUICKSTART.md](QUICKSTART.md) and begin your journey today!
