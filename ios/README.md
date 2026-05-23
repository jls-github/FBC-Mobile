# FBC Enumclaw – iOS App

Native iOS shell for First Baptist Church of Enumclaw, built with
[Hotwire Native for iOS](https://github.com/hotwired/hotwire-native-ios).

## Requirements

- Xcode 15+
- CocoaPods (`gem install cocoapods`)
- [XcodeGen](https://github.com/yonaskolb/XcodeGen) (`brew install xcodegen`)

## Setup

```bash
cd ios
xcodegen generate      # creates FBCEnumclaw.xcodeproj from project.yml
pod install            # installs HotwireNative via CocoaPods
open FBCEnumclaw.xcworkspace
```

## Local Development

Change `Constants.serverURL` in `FBCEnumclaw/Configuration/Constants.swift`:

```swift
static let serverURL = URL(string: "http://localhost:3000")!
```

Make sure your Rails server is running (`bin/dev`) and your Mac and
iPhone simulator can reach it.

## Architecture

| File | Purpose |
|---|---|
| `AppDelegate.swift` | Hotwire configuration, global appearance |
| `SceneDelegate.swift` | Creates the window and root tab bar |
| `MainTabBarController.swift` | 5-tab navigation, one `Navigator` per tab |
| `ApplicationController.swift` | Base web view controller for all screens |
| `ModalWebViewController.swift` | Sheet-style controller for Prayer Requests |
| `Configuration/Constants.swift` | Server URL, path config URL |

## Path Configuration

The app reads `/hotwire-native-configuration.json` from the server on
each launch. Update that file to change navigation behavior without
releasing a new app version.
