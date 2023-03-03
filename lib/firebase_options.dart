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
    apiKey: 'AIzaSyDOvTYi1Akl_Dbfbt9jul1U4hQ68U57r6s',
    appId: '1:322645598423:web:6a06bef095bc7b73161092',
    messagingSenderId: '322645598423',
    projectId: 'gdsc-solution-challenge-183be',
    authDomain: 'gdsc-solution-challenge-183be.firebaseapp.com',
    storageBucket: 'gdsc-solution-challenge-183be.appspot.com',
    measurementId: 'G-NQJZHW0SFN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwhBRS6FvcPj7JGW_xgTUEErNHKL-EjZs',
    appId: '1:322645598423:android:c32c00a41501a00f161092',
    messagingSenderId: '322645598423',
    projectId: 'gdsc-solution-challenge-183be',
    storageBucket: 'gdsc-solution-challenge-183be.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNRTup1m0BebPKlW6urZuNTX5_vq0cksk',
    appId: '1:322645598423:ios:6562986883edf651161092',
    messagingSenderId: '322645598423',
    projectId: 'gdsc-solution-challenge-183be',
    storageBucket: 'gdsc-solution-challenge-183be.appspot.com',
    iosClientId: '322645598423-gadpnep7ju4g9rbgelijnesj1kumj3uc.apps.googleusercontent.com',
    iosBundleId: 'com.example.solutionChallenge',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCNRTup1m0BebPKlW6urZuNTX5_vq0cksk',
    appId: '1:322645598423:ios:6562986883edf651161092',
    messagingSenderId: '322645598423',
    projectId: 'gdsc-solution-challenge-183be',
    storageBucket: 'gdsc-solution-challenge-183be.appspot.com',
    iosClientId: '322645598423-gadpnep7ju4g9rbgelijnesj1kumj3uc.apps.googleusercontent.com',
    iosBundleId: 'com.example.solutionChallenge',
  );
}
