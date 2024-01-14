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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyArMcm06oFukm9DBnv5dfJGtRwztk6N3bo',
    appId: '1:962882822821:web:ec3a94201db4d33793e34c',
    messagingSenderId: '962882822821',
    projectId: 'inventory-e1c74',
    authDomain: 'inventory-e1c74.firebaseapp.com',
    storageBucket: 'inventory-e1c74.appspot.com',
    measurementId: 'G-56M7LPPVWB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBaGJqoSDUOCIiltEA8W4Nr-s02lMbCXDI',
    appId: '1:962882822821:android:5086465da88bae0993e34c',
    messagingSenderId: '962882822821',
    projectId: 'inventory-e1c74',
    storageBucket: 'inventory-e1c74.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB20X3QKOi1towUGI8qsS7LIVKlXcAfIb8',
    appId: '1:962882822821:ios:e7694217523a7de993e34c',
    messagingSenderId: '962882822821',
    projectId: 'inventory-e1c74',
    storageBucket: 'inventory-e1c74.appspot.com',
    iosBundleId: 'com.example.itemRequest',
  );
}
