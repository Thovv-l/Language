# VSCode + Expo Mobile Preview Guide

## 🚀 Quick Start in VSCode

### Step 1: Open in VSCode

```bash
cd mobile-app
code .
```

### Step 2: Install Dependencies

Open VSCode terminal (`Ctrl+` ` or `View > Terminal`):

```bash
npm install
```

### Step 3: Start Development Server

```bash
npm start
```

You'll see:
```
Starting Metro Bundler
› Metro waiting on exp://192.168.1.X:19000
› Scan the QR code above with Expo Go (Android) or the Camera app (iOS)

Press a │ open Android
Press i │ open iOS simulator
Press w │ open web

Press j │ open debugger
Press r │ reload app
Press m │ toggle menu
Press ? │ show all commands
```

### Step 4: Choose Your Preview Method

#### Option A: Phone Preview (Best!)

1. **Install Expo Go**
   - iOS: https://apps.apple.com/app/expo-go/id982107779
   - Android: https://play.google.com/store/apps/details?id=host.exp.exponent

2. **Scan QR Code**
   - iOS: Use Camera app
   - Android: Use Expo Go app

3. **App loads on your phone!**

#### Option B: Web Preview

Press `w` or run:
```bash
npm run web
```

Opens in browser at `http://localhost:19006`

#### Option C: Use VSCode Debugger

1. Go to Debug panel (Cmd/Ctrl + Shift + D)
2. Select "Expo: Start (Web)"
3. Press F5
4. Preview opens automatically!

## 📱 Mobile Preview Features

### Live Reload
- Save any file → App updates instantly
- No manual refresh needed
- Works on phone and web

### Dev Menu
**On Phone:**
- Shake device
- Or press `m` in terminal

**In Browser:**
- Press Cmd/Ctrl + M

### Hot Reload
Edit a component, save, see changes immediately!

```javascript
// Try editing this in HomeScreen.js:
<Text style={styles.greeting}>Hello {user.name}!</Text>

// Change to:
<Text style={styles.greeting}>Hi there, {user.name}!</Text>

// Save → Updates instantly!
```

## 🎨 VSCode Extensions for Better Experience

### Required Extensions

Install these from VSCode Marketplace:

1. **React Native Tools** (msjsdiag.vscode-react-native)
   - Debugging
   - IntelliSense
   - Code snippets

2. **Expo Tools** (expo.vscode-expo-tools)
   - Expo-specific features
   - Quick commands

### Recommended Extensions

3. **ES7 React Snippets** (dsznajder.es7-react-js-snippets)
   - Type `rnfe` → Creates functional component
   - Type `uss` → Creates useState hook

4. **Prettier** (esbenp.prettier-vscode)
   - Auto-format on save

5. **Live Server** (ritwickdey.liveserver)
   - Preview web version

## 🐛 Debugging in VSCode

### Set Breakpoints

1. Click left of line number (red dot appears)
2. Press F5 to start debugging
3. App pauses at breakpoint
4. Inspect variables in Debug panel

### Console Logs

```javascript
console.log('User data:', user);
```

View output in:
- VSCode Debug Console
- Terminal
- Phone Expo Go app (shake → View logs)

### React DevTools

```bash
# Install
npm install -g react-devtools

# Run
react-devtools
```

## 📂 VSCode Workspace Setup

### Recommended Folder Structure

```
Explorer Panel:
├── src/
│   ├── screens/       ← Your screens
│   ├── contexts/      ← State management
│   └── data/          ← Lesson content
├── App.js             ← Main entry
└── package.json
```

### Quick File Navigation

- `Cmd/Ctrl + P` → Quick open file
- `Cmd/Ctrl + Shift + F` → Search across files
- `Cmd/Ctrl + Click` → Jump to definition

## 🌐 Preview on Different Devices

### Phone + VSCode Side-by-Side

1. **On Mac:**
   - VSCode on left half
   - iPhone simulator on right half

2. **On Windows:**
   - VSCode on left monitor
   - Android emulator on right monitor

### Multiple Device Preview

```bash
# Start dev server
npm start

# Scan QR with multiple phones
# All phones show live preview!
```

## 🔧 VSCode Terminal Commands

### Essential Commands

```bash
# Start development
npm start

# Start web only
npm run web

# Clear cache and restart
npx expo start -c

# Use tunnel (for remote access)
npx expo start --tunnel
```

### Multi-Terminal Workflow

1. **Terminal 1:** `npm start` (keep running)
2. **Terminal 2:** Git commands
3. **Terminal 3:** Additional tools

Create terminals: Click `+` in terminal panel

## 🎯 Workflow Examples

### Example 1: Edit Home Screen

1. Open `src/screens/HomeScreen.js`
2. Make changes
3. Save (`Cmd/Ctrl + S`)
4. Check phone → Updated!

### Example 2: Add New Lesson

1. Open `src/data/lessonContent.js`
2. Add new lesson object
3. Save
4. Phone updates
5. Test new lesson

### Example 3: Fix Bug

1. Set breakpoint in code
2. Press F5 to debug
3. Trigger bug in app
4. Inspect variables
5. Fix and save
6. Test fix on phone

## 📊 VSCode Status Bar

When Expo is running, status bar shows:

- ⚛️ React Native
- 📱 Connected devices
- 🔄 Reload status

## 🚀 Deploy from VSCode

### Quick Web Deploy

```bash
# Terminal in VSCode
npm run web:build
npx vercel deploy

# Gets URL like:
# https://language-app-abc123.vercel.app
```

### Share Phone Preview

```bash
# Publish to Expo
npx expo publish

# Share URL:
# exp://exp.host/@yourname/language-app
```

## 🎨 Customize VSCode for React Native

### Custom Keybindings

File → Preferences → Keyboard Shortcuts

```json
{
  "key": "cmd+r",
  "command": "reactNative.reloadApp"
},
{
  "key": "cmd+shift+d",
  "command": "reactNative.showDevMenu"
}
```

### Custom Tasks

`.vscode/tasks.json` (already included):

- `Cmd/Ctrl + Shift + B` → Start Expo
- Quick task menu for common operations

## 💡 Pro Tips

### 1. Split Editor

- `Cmd/Ctrl + \` → Split editor
- Edit screen + view changes side-by-side

### 2. Zen Mode

- `Cmd/Ctrl + K Z` → Distraction-free coding
- Perfect for focus time

### 3. Multi-Cursor Editing

- `Alt/Option + Click` → Multiple cursors
- Edit multiple lines at once

### 4. Emmet in JSX

Type shortcuts for faster coding:
- `div.container` → `<div className="container"></div>`
- `View.row` → `<View style={styles.row}></View>`

### 5. Git Integration

- Source Control panel (`Ctrl+Shift+G`)
- Stage, commit, push from VSCode
- View diffs inline

## 🐛 Troubleshooting

### Can't See QR Code?

```bash
# Use tunnel mode
npx expo start --tunnel
```

### App Won't Load on Phone?

1. Check same WiFi network
2. Disable VPN
3. Restart Expo server
4. Clear Expo Go cache

### VSCode Extensions Not Working?

1. Reload VSCode (`Cmd/Ctrl + Shift + P` → "Reload Window")
2. Check extension is enabled
3. Update extensions

### Performance Issues?

```bash
# Clear all caches
npx expo start -c

# Close other apps
# Use production build for testing
```

## 📱 Testing on Real Devices

### iOS (Mac Only)

```bash
# Open in simulator
npm run ios

# Or press 'i' in terminal
```

### Android

```bash
# Open in emulator
npm run android

# Or press 'a' in terminal
```

### Physical Device

Best experience! Just scan QR code with Expo Go.

## 🌟 Recommended VSCode Workflow

1. **Morning:**
   - Open VSCode
   - `npm start` in terminal
   - Scan QR on phone
   - Start coding!

2. **During Development:**
   - Edit files in VSCode
   - Save → Instant preview on phone
   - Use breakpoints for debugging
   - Check terminal for errors

3. **Testing:**
   - Test on phone (real device)
   - Test in browser (web version)
   - Test on different screen sizes

4. **Deployment:**
   - `npx expo publish` for staging
   - `vercel deploy` for web
   - Share link with testers

---

## 📚 Additional Resources

- [VSCode React Native Extension Docs](https://marketplace.visualstudio.com/items?itemName=msjsdiag.vscode-react-native)
- [Expo CLI Docs](https://docs.expo.dev/workflow/expo-cli/)
- [React Native Debugging](https://reactnative.dev/docs/debugging)

---

**Happy coding in VSCode! 🎉**

Run `npm start` and start building! 🚀
