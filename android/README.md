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

For the Android emulator, `localhost` on your Mac is `10.0.2.2`. Update `Constants.kt`:

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
| `MainApplication.kt` | Hotwire SDK configuration, path config loading |
| `Constants.kt` | Server URL and tab root URLs — change for local dev |
| `MainActivity.kt` | Host activity with bottom navigation |
| `MainSessionNavHostFragment.kt` | Hotwire session + registered fragment list |
| `WebFragment.kt` | Standard full-screen web page fragment |
| `ModalWebFragment.kt` | Bottom-sheet fragment for prayer requests |

## Tab Structure

| Tab | URL |
|---|---|
| Home | `/` |
| Sermons | `/sermons` |
| Events | `/events` |
| Connect | `/groups` |
| Give | `/give` |

## Path Configuration

The app reads `/hotwire-native-configuration.json` from the server on each
launch to control navigation behavior (push vs. modal, pull-to-refresh) without
requiring a new Play Store release.
