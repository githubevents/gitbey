# GitBey Flutter App Launch Guide

A comprehensive guide for setting up and running the GitBey Flutter application on macOS and Windows.

## Prerequisites

Before launching the app, ensure you have the following installed:

- **Flutter SDK** - Latest stable version
- **VS Code** with Flutter extension
- **Platform-specific tools:**
  - **macOS/iOS**: Xcode (for iOS Simulator)
  - **Windows/Android**: Android Studio with emulator configured
- **Git** (recommended: Git Bash for Windows)

## Initial Setup Verification

Verify your Flutter installation by running:

```bash
flutter doctor
```

This command checks your development environment and reports any missing dependencies or configuration issues.

## Platform-Specific Launch Instructions

### macOS Development

#### Starting the iOS Simulator

Launch the iOS Simulator from your terminal:

```bash
open -a Simulator
```

#### Running the App

**Method 1: Using VS Code**
1. Open the Command Palette (`Cmd + Shift + P`)
2. Type "Flutter: Select Device" and select your simulator
3. Press `F5` or click the Run button in VS Code

**Method 2: Using Terminal**
```bash
cd /Users/alacolombiadev/Desktop/Code/gitbey-andrea/gitbey
flutter run
```

### Windows Development

#### Starting the Android Emulator

**Method 1: Via Android Studio**
1. Open Android Studio
2. Navigate to `Tools > Device Manager`
3. Click the Play ▶️ button next to your preferred emulator

**Method 2: Via Command Line**
```powershell
# List available emulators
flutter emulators

# Launch specific emulator (replace with your emulator ID)
flutter emulators --launch Pixel_5_API_30
```

#### Running the App

**Method 1: Using VS Code**
1. Open the Command Palette (`Ctrl + Shift + P`)
2. Type "Flutter: Select Device" and select your emulator
3. Press `F5` or click the Run button

**Method 2: Using Command Line**
```powershell
cd \path\to\gitbey-andrea\gitbey
flutter run
```

## Development Workflow

### Hot Reload Commands

Once your app is running, use these keyboard shortcuts in the terminal:

- **`r`** - Hot reload (apply code changes instantly)
- **`R`** - Hot restart (restart the entire app)
- **`q`** - Quit the app

### Device Management

Check connected devices and simulators:

```bash
flutter devices
```

## Troubleshooting

### Build Issues

If you encounter build problems, try cleaning and rebuilding:

```bash
flutter clean
flutter pub get
flutter run
```

### iOS-Specific Issues (macOS)

For iOS pod-related problems:

```bash
cd ios
pod install
cd ..
flutter run
```

### Android-Specific Issues (Windows)

**Device Detection Problems:**
```powershell
# Verify ADB connection
adb devices

# Check Flutter device recognition
flutter devices
```

**Android License Issues:**
```powershell
flutter doctor --android-licenses
```

**PATH Configuration:**
If Flutter commands aren't recognized:
1. Search for "Environment Variables" in Windows
2. Edit the `Path` variable under User variables
3. Add your Flutter SDK's `bin` directory path

### Simulator/Emulator Not Showing

If your simulator or emulator doesn't appear in the device list:

1. Ensure the simulator/emulator is fully started
2. Run `flutter devices` to verify detection
3. Try restarting VS Code or your terminal
4. Check that your emulator has sufficient system resources

## Project Structure

The GitBey app is located at:
```
yourlocal directory
```

Navigate to this directory before running Flutter commands.

## Additional Resources

- **Flutter Documentation**: [flutter.dev](https://flutter.dev)
- **VS Code Flutter Extension**: Provides debugging, hot reload, and device management
- **Flutter Inspector**: Available in VS Code for UI debugging

---
