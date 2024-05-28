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
    apiKey: 'AIzaSyCzxPsnadKVh_7gMaKOmizc_AXIRtD6qMQ',
    appId: '1:751586261864:web:e70f06319ffd06f7a274dd',
    messagingSenderId: '751586261864',
    projectId: 'caricelahyukk',
    authDomain: 'caricelahyukk.firebaseapp.com',
    databaseURL: 'https://caricelahyukk-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'caricelahyukk.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWBTenQfMg4fRwufmZw0QiO1ukq4hmWs4',
    appId: '1:751586261864:android:633c1a5ccaff97bca274dd',
    messagingSenderId: '751586261864',
    projectId: 'caricelahyukk',
    databaseURL: 'https://caricelahyukk-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'caricelahyukk.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDwa6FcccTTEG3404kBBlUJJ1_UQngW-d0',
    appId: '1:751586261864:ios:618a20da94944d1ba274dd',
    messagingSenderId: '751586261864',
    projectId: 'caricelahyukk',
    databaseURL: 'https://caricelahyukk-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'caricelahyukk.appspot.com',
    iosBundleId: 'com.example.cariCelah',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDwa6FcccTTEG3404kBBlUJJ1_UQngW-d0',
    appId: '1:751586261864:ios:618a20da94944d1ba274dd',
    messagingSenderId: '751586261864',
    projectId: 'caricelahyukk',
    databaseURL: 'https://caricelahyukk-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'caricelahyukk.appspot.com',
    iosBundleId: 'com.example.cariCelah',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCzxPsnadKVh_7gMaKOmizc_AXIRtD6qMQ',
    appId: '1:751586261864:web:8252fd75d00c9d38a274dd',
    messagingSenderId: '751586261864',
    projectId: 'caricelahyukk',
    authDomain: 'caricelahyukk.firebaseapp.com',
    databaseURL: 'https://caricelahyukk-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'caricelahyukk.appspot.com',
  );

}