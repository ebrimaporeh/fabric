// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDByb6BXKIeA2UHKTq-U0E4kHe09XOA3Ng',
    appId: '1:449850759472:web:8b39f1bd780f3794d390f5',
    messagingSenderId: '449850759472',
    projectId: 'fabric-2796b',
    authDomain: 'fabric-2796b.firebaseapp.com',
    storageBucket: 'fabric-2796b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLQg3D6oLtklZTkbAgF396Hdgke5ZUB_M',
    appId: '1:449850759472:android:2aff1a8a447a6628d390f5',
    messagingSenderId: '449850759472',
    projectId: 'fabric-2796b',
    storageBucket: 'fabric-2796b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6MhfO6JYO5CFBFZvwonmzsq5mxZahLt8',
    appId: '1:449850759472:ios:a40d414d6b6c0f82d390f5',
    messagingSenderId: '449850759472',
    projectId: 'fabric-2796b',
    storageBucket: 'fabric-2796b.appspot.com',
    iosClientId: '449850759472-9m1ojoo6n8hg50tmdt37185dhos7ubur.apps.googleusercontent.com',
    iosBundleId: 'com.example.fabricApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6MhfO6JYO5CFBFZvwonmzsq5mxZahLt8',
    appId: '1:449850759472:ios:d1b4ceaf18f5a540d390f5',
    messagingSenderId: '449850759472',
    projectId: 'fabric-2796b',
    storageBucket: 'fabric-2796b.appspot.com',
    iosClientId: '449850759472-3hq481emaf99cetkdb0ru5sgdeg7a0ie.apps.googleusercontent.com',
    iosBundleId: 'com.example.fabricApp.RunnerTests',
  );
}