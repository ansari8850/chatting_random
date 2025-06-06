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
    apiKey: 'AIzaSyDyUo6j9xoLA1Z6TcP0WpE8fDUZBt6vjko',
    appId: '1:315387621088:android:d5d8c4d894edb536876a85',
    messagingSenderId: '315387621088',
    projectId: 'chattingapplication-b384c',
    databaseURL: 'https://chattingapplication-b384c-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'chattingapplication-b384c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDGEkuNYFRYsxN4EXMSjxIDZToassYL0sk',
    appId: '1:315387621088:ios:d923519622e2a48e876a85',
    messagingSenderId: '315387621088',
    projectId: 'chattingapplication-b384c',
    databaseURL: 'https://chattingapplication-b384c-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'chattingapplication-b384c.firebasestorage.app',
    iosBundleId: 'com.example.chattingApplicationAgent',
  );
}
