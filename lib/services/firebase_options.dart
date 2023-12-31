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
    apiKey: 'AIzaSyAbkSt4osnXwerpvWFuTHtk_YTdFLQfRFg',
    appId: '1:562992113910:web:3c41bd221d5ce9f70764d7',
    messagingSenderId: '562992113910',
    projectId: 'todo-app-with-firebase-a-250b6',
    authDomain: 'todo-app-with-firebase-a-250b6.firebaseapp.com',
    storageBucket: 'todo-app-with-firebase-a-250b6.appspot.com',
    measurementId: 'G-JJVMWVCPLD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdweQmvEq-l3xPgD111Kavg9fmjOIIGPk',
    appId: '1:562992113910:android:0f5dac97d3eebd6b0764d7',
    messagingSenderId: '562992113910',
    projectId: 'todo-app-with-firebase-a-250b6',
    storageBucket: 'todo-app-with-firebase-a-250b6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBKMYC7wP_lj52TNYkySYvaE-rO2lfVPY',
    appId: '1:562992113910:ios:c8866dbc9cd8d07e0764d7',
    messagingSenderId: '562992113910',
    projectId: 'todo-app-with-firebase-a-250b6',
    storageBucket: 'todo-app-with-firebase-a-250b6.appspot.com',
    iosBundleId: 'com.jurakuziyev.todoWithFirebaseAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBBKMYC7wP_lj52TNYkySYvaE-rO2lfVPY',
    appId: '1:562992113910:ios:5e3c2d4e314b4b110764d7',
    messagingSenderId: '562992113910',
    projectId: 'todo-app-with-firebase-a-250b6',
    storageBucket: 'todo-app-with-firebase-a-250b6.appspot.com',
    iosBundleId: 'com.jurakuziyev.todoWithFirebaseAuth.RunnerTests',
  );
}
