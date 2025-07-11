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
    apiKey: 'AIzaSyAa_UAdFfsvZXiuVcjeg2FZqmWuhDlwXio',
    appId: '1:744453858462:web:14fecb561b9bb29311078f',
    messagingSenderId: '744453858462',
    projectId: 'birthday-32b48',
    authDomain: 'birthday-32b48.firebaseapp.com',
    storageBucket: 'birthday-32b48.firebasestorage.app',
    measurementId: 'G-ECTYBWEBMB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbTuAAihDupgmwnDQOPsyuLAeewcOpLXk',
    appId: '1:744453858462:android:f6828d28c45ecef211078f',
    messagingSenderId: '744453858462',
    projectId: 'birthday-32b48',
    storageBucket: 'birthday-32b48.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDaQWQHMZiMpFymL0PWXTpMkyUhusSD_nE',
    appId: '1:744453858462:ios:0f21da7367655c9311078f',
    messagingSenderId: '744453858462',
    projectId: 'birthday-32b48',
    storageBucket: 'birthday-32b48.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDaQWQHMZiMpFymL0PWXTpMkyUhusSD_nE',
    appId: '1:744453858462:ios:0f21da7367655c9311078f',
    messagingSenderId: '744453858462',
    projectId: 'birthday-32b48',
    storageBucket: 'birthday-32b48.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAa_UAdFfsvZXiuVcjeg2FZqmWuhDlwXio',
    appId: '1:744453858462:web:34084bde3eb23e8311078f',
    messagingSenderId: '744453858462',
    projectId: 'birthday-32b48',
    authDomain: 'birthday-32b48.firebaseapp.com',
    storageBucket: 'birthday-32b48.firebasestorage.app',
    measurementId: 'G-L0SMVYMY6K',
  );
}
