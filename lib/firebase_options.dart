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
        return windows;
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
    apiKey: 'AIzaSyD5iYklyLNK2EzmNZ5q11WL7qg4m-2P_U0',
    appId: '1:374883033020:web:a2f98a454577b5b03155b9',
    messagingSenderId: '374883033020',
    projectId: 'flutter-exam-1cd32',
    authDomain: 'flutter-exam-1cd32.firebaseapp.com',
    storageBucket: 'flutter-exam-1cd32.appspot.com',
    measurementId: 'G-DRHSWGE1YG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA85TzzlFz3NLCSvIRi4iJDrC-icpUqvm8',
    appId: '1:374883033020:android:f08956111a5e7b723155b9',
    messagingSenderId: '374883033020',
    projectId: 'flutter-exam-1cd32',
    storageBucket: 'flutter-exam-1cd32.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4eVxf7Q28o8E0iRsqUcogd4Z-MdVs_Rk',
    appId: '1:374883033020:ios:5f64ee24610b98fd3155b9',
    messagingSenderId: '374883033020',
    projectId: 'flutter-exam-1cd32',
    storageBucket: 'flutter-exam-1cd32.appspot.com',
    iosBundleId: 'com.example.examAdFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC4eVxf7Q28o8E0iRsqUcogd4Z-MdVs_Rk',
    appId: '1:374883033020:ios:5f64ee24610b98fd3155b9',
    messagingSenderId: '374883033020',
    projectId: 'flutter-exam-1cd32',
    storageBucket: 'flutter-exam-1cd32.appspot.com',
    iosBundleId: 'com.example.examAdFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD5iYklyLNK2EzmNZ5q11WL7qg4m-2P_U0',
    appId: '1:374883033020:web:eb7e623f72542e513155b9',
    messagingSenderId: '374883033020',
    projectId: 'flutter-exam-1cd32',
    authDomain: 'flutter-exam-1cd32.firebaseapp.com',
    storageBucket: 'flutter-exam-1cd32.appspot.com',
    measurementId: 'G-96X74TX2N0',
  );
}
