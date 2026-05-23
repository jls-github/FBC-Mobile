# FBC Enumclaw – Android App

Native Android shell for First Baptist Church of Enumclaw, built with
[Hotwire Native for Android](https://github.com/hotwired/hotwire-native-android).

## Requirements

- Android Studio Hedgehog (2023.1) or newer
- JDK 17
- Android SDK 34

## Setup

1. Open **Android Studio**
2. Choose **Open** → select the `android/` folder
3. Let Gradle sync complete
4. Run on a device or emulator (**Run → Run 'app'**)

## Local Development

For the Android emulator, `localhost` on your Mac is `10.0.2.2`.
Update `Constants.kt`:

```kotlin
const val SERVER_URL = "http://10.0.2.2:3000"
```

Also add to `AndroidManifest.xml` inside `<application>`:
```xml
android:usesCleartextTraffic="true"
```

## Architecture

| File | Purpose |
|---|---|
| `MainApplication.kt` | Hotwire SDK configuration |
| `Constants.kt` | Server URL, tab URLs |
| `MainActivity.kt` | Host activity, bottom navigation |
| `MainSessionNavHostFragment.kt` | Hotwire session + registered fragments |
| `WebFragment.kt` | Standard web page fragment |
| `ModalWebFragment.kt` | Bottom-sheet fragment for prayer requests |

## Path Configuration

The app reads `/hotwire-native-configuration.json` from the server on
each launch to control navigation behavior without requiring a new release.
