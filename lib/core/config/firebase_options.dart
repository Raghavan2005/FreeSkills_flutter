// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJjG7SrV9Qjq-OkPwUmtBBVMyacBGIssE',
    appId: '1:1083151406467:android:eb6732c0856dc6dd9452b6',
    messagingSenderId: '1083151406467',
    projectId: 'freeskills-e1dd0',
    storageBucket: 'freeskills-e1dd0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAo-H1bKTTWlyyLkJt_YqF9fgUecN7yXpI',
    appId: '1:1083151406467:ios:6679b98280c7c3869452b6',
    messagingSenderId: '1083151406467',
    projectId: 'freeskills-e1dd0',
    storageBucket: 'freeskills-e1dd0.appspot.com',
    iosClientId: '1083151406467-9rljsi5hjn4526jdb0dokafqntam1eb8.apps.googleusercontent.com',
    iosBundleId: 'com.freeskills.raghavan.app.freeskills',
  );
}
