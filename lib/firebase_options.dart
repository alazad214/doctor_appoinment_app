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
    apiKey: 'AIzaSyAxM5MSG0LiysI0KYYcUgIdXCGFM9h0o8Q',
    appId: '1:571877333718:web:b6aae5eeec784bddc64777',
    messagingSenderId: '571877333718',
    projectId: 'arroggo-talk',
    authDomain: 'arroggo-talk.firebaseapp.com',
    storageBucket: 'arroggo-talk.appspot.com',
    measurementId: 'G-MWM0DL0PNT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVy61dB_P7Rf7T8ZfWaGltZZ_kxqoHKt8',
    appId: '1:571877333718:android:79307126d55cd6c8c64777',
    messagingSenderId: '571877333718',
    projectId: 'arroggo-talk',
    storageBucket: 'arroggo-talk.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCrXw1wJ2kUYGwD1bUv0QIrWJ9z3kFIF3w',
    appId: '1:571877333718:ios:57e4d454c1c640f3c64777',
    messagingSenderId: '571877333718',
    projectId: 'arroggo-talk',
    storageBucket: 'arroggo-talk.appspot.com',
    iosBundleId: 'com.example.doctorAppointment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCrXw1wJ2kUYGwD1bUv0QIrWJ9z3kFIF3w',
    appId: '1:571877333718:ios:57e4d454c1c640f3c64777',
    messagingSenderId: '571877333718',
    projectId: 'arroggo-talk',
    storageBucket: 'arroggo-talk.appspot.com',
    iosBundleId: 'com.example.doctorAppointment',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAxM5MSG0LiysI0KYYcUgIdXCGFM9h0o8Q',
    appId: '1:571877333718:web:6662ceccd9562376c64777',
    messagingSenderId: '571877333718',
    projectId: 'arroggo-talk',
    authDomain: 'arroggo-talk.firebaseapp.com',
    storageBucket: 'arroggo-talk.appspot.com',
    measurementId: 'G-MTDXL58TSV',
  );
}
