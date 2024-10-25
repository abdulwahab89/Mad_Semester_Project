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
    apiKey: 'AIzaSyCGyvHy4oq8DFaF3QvioQ2urkIRYoSVTJQ',
    appId: '1:1094096883225:web:a4f3833632f4d27e3ba488',
    messagingSenderId: '1094096883225',
    projectId: 'movie-review-app-38f57',
    authDomain: 'movie-review-app-38f57.firebaseapp.com',
    databaseURL: 'https://movie-review-app-38f57-default-rtdb.firebaseio.com',
    storageBucket: 'movie-review-app-38f57.appspot.com',
    measurementId: 'G-KSX4V2HT7J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgpoOgnh8bpzX7gZHHIeQc-ocjxIBPO80',
    appId: '1:1094096883225:android:5a0d56a5d2fa82383ba488',
    messagingSenderId: '1094096883225',
    projectId: 'movie-review-app-38f57',
    databaseURL: 'https://movie-review-app-38f57-default-rtdb.firebaseio.com',
    storageBucket: 'movie-review-app-38f57.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJxSZf331XJwb6Z73TsArJtt0BHn2no1s',
    appId: '1:1094096883225:ios:e6ecbecaaed1c4ea3ba488',
    messagingSenderId: '1094096883225',
    projectId: 'movie-review-app-38f57',
    databaseURL: 'https://movie-review-app-38f57-default-rtdb.firebaseio.com',
    storageBucket: 'movie-review-app-38f57.appspot.com',
    iosBundleId: 'com.example.moviepedia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDJxSZf331XJwb6Z73TsArJtt0BHn2no1s',
    appId: '1:1094096883225:ios:e6ecbecaaed1c4ea3ba488',
    messagingSenderId: '1094096883225',
    projectId: 'movie-review-app-38f57',
    databaseURL: 'https://movie-review-app-38f57-default-rtdb.firebaseio.com',
    storageBucket: 'movie-review-app-38f57.appspot.com',
    iosBundleId: 'com.example.moviepedia',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCGyvHy4oq8DFaF3QvioQ2urkIRYoSVTJQ',
    appId: '1:1094096883225:web:422814272c18877e3ba488',
    messagingSenderId: '1094096883225',
    projectId: 'movie-review-app-38f57',
    authDomain: 'movie-review-app-38f57.firebaseapp.com',
    databaseURL: 'https://movie-review-app-38f57-default-rtdb.firebaseio.com',
    storageBucket: 'movie-review-app-38f57.appspot.com',
    measurementId: 'G-L545H3N5X5',
  );
}