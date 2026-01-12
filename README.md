# Trustchex Flutter SDK Example App

This example app demonstrates KYC and identity verification with document scanning, facial recognition, liveness detection, and NFC eID support using the Trustchex Flutter SDK.

## Features

- 📄 Document scanning (passport, ID cards) with OCR
- 🔍 MRZ processing for travel documents  
- 📱 NFC eID card reading
- 👤 Facial recognition and liveness detection
- 🌐 Multi-language support (English, Turkish)
- 🎨 Customizable branding
- 🔗 Deep link support

## Prerequisites

- **Flutter**: ≥ 3.16.0
- **Dart**: ≥ 3.0.0
- **iOS**: ≥ 15.6 (Xcode 14.0+)
- **Android**: ≥ API 31
- **Camera**: Required
- **NFC**: Optional

## Installation

```bash
flutter pub get
```

### iOS Setup

1. Update `ios/Podfile` to set minimum iOS version:

```ruby
platform :ios, '15.6'
```

2. Add required permissions to `ios/Runner/Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>The app captures images of your ID, passport, and face, and records a video for
  secure identity verification and ensure compliance with KYC regulations.</string>
<key>NSMicrophoneUsageDescription</key>
<string>The app records a video with audio for secure identity verification and ensure
  compliance with KYC regulations.</string>
<key>NFCReaderUsageDescription</key>
<string>The app securely reads ID or passport data using NFC to verify your identity and
  ensure compliance with KYC regulations.</string>
<key>com.apple.developer.nfc.readersession.iso7816.select-identifiers</key>
<array>
  <string>A0000002471001</string>
</array>
```

3. Install iOS dependencies:

```bash
cd ios && pod install && cd ..
```

### Android Setup

Update `android/app/build.gradle`:

```gradle
android {
    compileSdkVersion 36
    
    defaultConfig {
        minSdkVersion 31
        targetSdkVersion 36
    }
}
```

Add permissions to `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.NFC" />
<uses-permission android:name="android.permission.RECORD_AUDIO" />
<uses-feature android:name="android.hardware.camera" android:required="true" />
<uses-feature android:name="android.hardware.nfc" android:required="false" />
```

## Running the App

```bash
# Run on Android
flutter run

# Run on iOS
flutter run

# Run in release mode
flutter run --release
```

## Usage

### Basic Implementation

```dart
import 'package:trustchex_flutter_sdk/trustchex_flutter_sdk.dart';

TrustchexView(
  sessionId: 'your-session-id',
  baseUrl: 'https://api.trustchex.com',
  onCompleted: () => print('Verification completed'),
  onError: (error) => print('Error: $error'),
)
```

### With Branding

```dart
TrustchexView(
  sessionId: 'your-session-id',
  baseUrl: 'https://api.trustchex.com',
  branding: TrustchexBranding(
    logoUrl: 'https://your-logo.png',
    primaryColor: Color(0xFF1E40AF),
    secondaryColor: Color(0xFFF8FAFC),
    tertiaryColor: Color(0xFFDC2626),
  ),
  locale: TrustchexLocale.en, // or TrustchexLocale.tr
  onCompleted: () => print('Completed'),
  onError: (error) => print('Error: $error'),
)
```

### Deep Link Handling (Optional)

For production apps, you can handle deep links to automatically start verification sessions. Add the `app_links` package:

```bash
flutter pub add app_links
```

Then implement deep link handling:

```dart
import 'package:trustchex_flutter_sdk/trustchex_flutter_sdk.dart';
import 'package:app_links/app_links.dart';

final appLinks = AppLinks();
appLinks.uriLinkStream.listen((uri) {
  final parsed = DeeplinkUtils.parseDeepLink(uri.toString());
  final sessionId = parsed?['sessionId'];
  final baseUrl = parsed?['baseUrl'] ?? 'https://api.trustchex.com';
  // Navigate to verification screen
});
```

## Configuration

### iOS Deep Links

Add to `ios/Runner/Info.plist`:

```xml
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>flutterexample</string>
    </array>
  </dict>
</array>
```

### Android Deep Links

Add to `android/app/src/main/AndroidManifest.xml` inside `<activity>`:

```xml
<intent-filter android:autoVerify="true">
  <action android:name="android.intent.action.VIEW" />
  <category android:name="android.intent.category.DEFAULT" />
  <category android:name="android.intent.category.BROWSABLE" />
  <data android:scheme="flutterexample" />
</intent-filter>
```

## Documentation

For complete documentation, visit:
- [Flutter SDK Documentation](https://docs.trustchex.com/docs/Flutter%20SDK/intro)
- [API Documentation](https://docs.trustchex.com/docs/REST%20API%20v1/intro)

## Support

- 📧 Email: support@trustchex.com
- 🌐 Website: https://trustchex.com
- 📚 Documentation: https://docs.trustchex.com

## License

This example app is licensed under the MIT License.
