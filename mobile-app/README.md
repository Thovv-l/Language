# 🌍 Language Learning App - React Native/Expo Version

A beautiful, fully functional language learning app built with React Native and Expo. Run it directly from VSCode with instant mobile preview!

## ✨ Features

- ✅ **Beautiful Green Theme UI** - Matches the modern design screenshots
- ✅ **5 Languages** - English, Portuguese, Spanish, French, Dutch
- ✅ **Interactive Quizzes** - Multiple choice, listening, vocabulary
- ✅ **Hearts/Lives System** - Like Duolingo!
- ✅ **Timer** - Timed challenges for each question
- ✅ **Progress Tracking** - Daily streaks, scores, achievements
- ✅ **Fully Functional** - Complete lesson flow from start to results
- ✅ **Cross-Platform** - iOS, Android, and Web

## 🚀 Quick Start (VSCode)

### Prerequisites
- Node.js 16+ installed
- VSCode
- iOS/Android phone OR use web browser

### 1. Install Dependencies

```bash
cd mobile-app
npm install
```

### 2. Start Expo

```bash
npm start
```

This opens the Expo Developer Tools in your terminal/browser.

### 3. Preview Options

**Option A: On Your Phone (Recommended)**
1. Install **Expo Go** app:
   - [iOS App Store](https://apps.apple.com/app/expo-go/id982107779)
   - [Google Play Store](https://play.google.com/store/apps/details?id=host.exp.exponent)
2. Scan the QR code with:
   - **iOS**: Camera app
   - **Android**: Expo Go app
3. App loads on your phone instantly!

**Option B: Web Browser**
```bash
# Press 'w' in the terminal
# Or run:
npm run web
```

**Option C: iOS Simulator (Mac only)**
```bash
# Press 'i' in the terminal
# Or run:
npm run ios
```

**Option D: Android Emulator**
```bash
# Press 'a' in the terminal
# Or run:
npm run android
```

## 📱 Using VSCode Extensions

### Option 1: React Native Tools (Microsoft)

1. Install extension: `msjsdiag.vscode-react-native`
2. Open Command Palette (`Cmd/Ctrl + Shift + P`)
3. Type: "React Native: Run Android/iOS"

### Option 2: Expo Tools

1. Install: `expo-tools` extension
2. View Expo panel in sidebar
3. One-click preview options

### Option 3: Live Preview in VSCode

1. Install: `Live Preview` extension by Microsoft
2. Start Expo web: `npm run web`
3. Right-click `index.html` → "Show Preview"

## 🌐 Deploy to Staging

### Expo Go (Instant Sharing)

```bash
# Publish to Expo cloud
npx expo publish
```

Share the generated link with anyone! They can open it in Expo Go app.

### Web Deployment (Free Options)

#### Vercel
```bash
# Install Vercel CLI
npm i -g vercel

# Deploy web version
npm run web:build
vercel deploy
```

#### Netlify
```bash
# Install Netlify CLI
npm i -g netlify-cli

# Deploy
npm run web:build
netlify deploy
```

### EAS Build (Production Apps)

```bash
# Install EAS CLI
npm install -g eas-cli

# Login to Expo
eas login

# Build for iOS/Android
eas build --platform ios
eas build --platform android

# Or build both
eas build --platform all
```

## 🛠️ VSCode Setup

### Recommended Extensions

```json
{
  "recommendations": [
    "msjsdiag.vscode-react-native",
    "dsznajder.es7-react-js-snippets",
    "esbenp.prettier-vscode",
    "dbaeumer.vscode-eslint",
    "expo.vscode-expo-tools"
  ]
}
```

### Launch Configuration

Create `.vscode/launch.json`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Expo: Start",
      "type": "reactnative",
      "request": "launch",
      "platform": "exponent"
    },
    {
      "name": "Expo: Web",
      "type": "reactnative",
      "request": "launch",
      "platform": "web"
    }
  ]
}
```

### Tasks Configuration

Create `.vscode/tasks.json`:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Start Expo",
      "type": "shell",
      "command": "npm start",
      "problemMatcher": [],
      "presentation": {
        "reveal": "always",
        "panel": "new"
      }
    },
    {
      "label": "Start Web Preview",
      "type": "shell",
      "command": "npm run web",
      "problemMatcher": []
    }
  ]
}
```

## 📂 Project Structure

```
mobile-app/
├── App.js                    # Main entry point
├── app.json                  # Expo configuration
├── package.json              # Dependencies
├── src/
│   ├── contexts/             # State management
│   │   └── AppContext.js
│   ├── data/                 # Lesson content
│   │   └── lessonContent.js
│   └── screens/              # All screens
│       ├── OnboardingScreen.js
│       ├── HomeScreen.js
│       ├── QuizScreen.js
│       └── QuizResultsScreen.js
└── assets/                   # Images, fonts, etc.
```

## 🎨 UI Components

### Color Scheme
- **Primary Green**: `#22C55E`
- **Secondary Green**: `#16A34A`
- **Orange**: `#F97316`
- **Purple**: `#8B5CF6`
- **Yellow**: `#FCD34D`
- **Background**: `#FFFFFF`

### Key Features Implemented

1. **Home Screen**
   - Learning progress card with daily checkmarks
   - Featured lessons carousel
   - Quiz cards with scores and progress
   - Beautiful gradients

2. **Quiz Screen**
   - Green gradient theme
   - Timer countdown
   - Hearts/lives system
   - Multiple choice questions
   - Listening practice (UI ready)
   - Instant feedback (correct/wrong)

3. **Results Screen**
   - Trophy/emoji based on performance
   - Star rating (1-3 stars)
   - Score percentage
   - XP earned
   - Retry option

4. **Onboarding**
   - Welcome screen
   - Language selection
   - Smooth transitions

## 🔥 Hot Reload

Expo supports hot reload! Edit any file and see changes instantly:

1. Edit `src/screens/HomeScreen.js`
2. Save file (`Cmd/Ctrl + S`)
3. App updates automatically on phone/browser
4. No rebuild needed!

## 📱 Mobile Preview Tips

### Using Expo Go on Phone

1. Keep phone on same WiFi as computer
2. Shake phone to open developer menu
3. Enable "Live Reload" and "Hot Reload"
4. Edit code → Save → See changes instantly!

### Troubleshooting

**Can't connect?**
```bash
# Use tunnel mode
npx expo start --tunnel
```

**Slow updates?**
```bash
# Clear cache
npx expo start -c
```

**Port conflict?**
```bash
# Use different port
npx expo start --port 19001
```

## 🌐 Staging Deployment Options

### 1. Expo Snack (Instant Preview)

Visit: https://snack.expo.dev
- Paste your code
- Get instant preview link
- Share with anyone
- No setup needed!

### 2. Expo Publish (Recommended)

```bash
npx expo publish
```

- Gets a permanent URL
- Updates over-the-air
- Works in Expo Go app
- Free hosting

### 3. Web Preview (Vercel/Netlify)

```bash
# Build for web
npx expo export:web

# Deploy to Vercel
vercel --prod

# Or Netlify
netlify deploy --prod
```

### 4. TestFlight (iOS)

```bash
# Build with EAS
eas build --platform ios

# Submit to TestFlight
eas submit --platform ios
```

### 5. Google Play Internal Testing (Android)

```bash
# Build with EAS
eas build --platform android

# Submit to Play Console
eas submit --platform android
```

## 🎯 Testing Checklist

- [ ] Onboarding flow works
- [ ] Can select languages
- [ ] Home screen displays correctly
- [ ] Can start a quiz
- [ ] Questions load properly
- [ ] Timer counts down
- [ ] Hearts decrease on wrong answers
- [ ] Correct/wrong feedback shows
- [ ] Results screen displays
- [ ] Score calculation is correct
- [ ] Can retry quiz
- [ ] Can navigate back to home

## 🚀 Production Deployment

### Web (Recommended for staging)

```bash
# Build optimized web version
npx expo export:web

# Deploy to Vercel
vercel --prod

# Your staging URL:
# https://language-learning-app.vercel.app
```

### Native Apps

```bash
# Configure EAS
eas init

# Build iOS
eas build --platform ios --profile production

# Build Android
eas build --platform android --profile production

# Submit to app stores
eas submit --platform all
```

## 📊 Performance Tips

1. **Optimize Images**
   - Use WebP format
   - Compress assets
   - Lazy load images

2. **Code Splitting**
   - Already configured with Expo
   - Screens loaded on demand

3. **Caching**
   - AsyncStorage for user data
   - Automatic by Expo

## 🐛 Common Issues

**Issue: Expo Go won't connect**
```bash
# Solution: Use tunnel
npx expo start --tunnel
```

**Issue: White screen on load**
```bash
# Solution: Clear cache
npx expo start -c
```

**Issue: Slow on Android**
```bash
# Solution: Enable Hermes
# (Already enabled in app.json)
```

## 📚 Resources

- [Expo Documentation](https://docs.expo.dev)
- [React Native Docs](https://reactnative.dev)
- [React Navigation](https://reactnavigation.org)
- [Expo Examples](https://docs.expo.dev/examples)

## 🎓 Next Steps

1. Add more lessons
2. Implement audio playback
3. Add speech recognition
4. Create more exercise types
5. Add social features
6. Implement spaced repetition

## 💬 Support

**VSCode Issues?**
- Check Output panel
- View Expo logs
- Use Debug Console

**Expo Issues?**
- Check terminal output
- Shake device for dev menu
- Check Expo status: https://status.expo.dev

---

**Ready to preview?** Run `npm start` and scan the QR code! 🚀📱
