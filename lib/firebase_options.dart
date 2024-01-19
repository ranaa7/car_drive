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
    apiKey: 'AIzaSyAP3PXygMxPyFKaS_pLbq6h2IwzQehHkC8',
    appId: '1:1097474489410:web:11648748c3a668ff3f41db',
    messagingSenderId: '1097474489410',
    projectId: 'riseup-d61e4',
    authDomain: 'riseup-d61e4.firebaseapp.com',
    storageBucket: 'riseup-d61e4.appspot.com',
    measurementId: 'G-46VJV28X71',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCkApNvxxyAzXxBv9UbGNH1Yzf40M1PhOc',
    appId: '1:1097474489410:android:ea9b3a50322ebba13f41db',
    messagingSenderId: '1097474489410',
    projectId: 'riseup-d61e4',
    storageBucket: 'riseup-d61e4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwCcYHqkx8XnHB5SDaQgGkiPD2FNNQqTA',
    appId: '1:1097474489410:ios:d1e8ccb41e70c2543f41db',
    messagingSenderId: '1097474489410',
    projectId: 'riseup-d61e4',
    storageBucket: 'riseup-d61e4.appspot.com',
    androidClientId: '1097474489410-2p1hmifla6tds020lsu3u20soigodb41.apps.googleusercontent.com',
    iosBundleId: 'com.example.more2Drive',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwCcYHqkx8XnHB5SDaQgGkiPD2FNNQqTA',
    appId: '1:1097474489410:ios:5f6d15ab5ecab3dd3f41db',
    messagingSenderId: '1097474489410',
    projectId: 'riseup-d61e4',
    storageBucket: 'riseup-d61e4.appspot.com',
    androidClientId: '1097474489410-2p1hmifla6tds020lsu3u20soigodb41.apps.googleusercontent.com',
    iosBundleId: 'com.example.more2Drive.RunnerTests',
  );
}
