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
    apiKey: 'AIzaSyAQFkapAt8Qa661aZ0RRp4pnMVejuBwd-Y',
    appId: '1:995047399971:web:d3644bb3cb1007dc4c8796',
    messagingSenderId: '995047399971',
    projectId: 'reparin-mobile-9ad64',
    authDomain: 'reparin-mobile-9ad64.firebaseapp.com',
    storageBucket: 'reparin-mobile-9ad64.appspot.com',
    measurementId: 'G-8NNSN4ZVPZ',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKK1LHK2Y3YRilD_obXpNIpktoaH8QiU8',
    appId: '1:995047399971:ios:2a8ad7df0f46f0694c8796',
    messagingSenderId: '995047399971',
    projectId: 'reparin-mobile-9ad64',
    storageBucket: 'reparin-mobile-9ad64.appspot.com',
    iosClientId: '995047399971-2hcoivkao4b880jf5dfi0bas8s08u2lf.apps.googleusercontent.com',
    iosBundleId: 'xyz.reparin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCKK1LHK2Y3YRilD_obXpNIpktoaH8QiU8',
    appId: '1:995047399971:ios:2a8ad7df0f46f0694c8796',
    messagingSenderId: '995047399971',
    projectId: 'reparin-mobile-9ad64',
    storageBucket: 'reparin-mobile-9ad64.appspot.com',
    iosClientId: '995047399971-2hcoivkao4b880jf5dfi0bas8s08u2lf.apps.googleusercontent.com',
    iosBundleId: 'xyz.reparin',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAQFkapAt8Qa661aZ0RRp4pnMVejuBwd-Y',
    appId: '1:995047399971:web:d47f606b8058b45e4c8796',
    messagingSenderId: '995047399971',
    projectId: 'reparin-mobile-9ad64',
    authDomain: 'reparin-mobile-9ad64.firebaseapp.com',
    storageBucket: 'reparin-mobile-9ad64.appspot.com',
    measurementId: 'G-CXL49X4W6M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADA9_fVVRWtTQj-lro4b4qo_6ZA_ZkBEQ',
    appId: '1:995047399971:android:db363c161be9f34c4c8796',
    messagingSenderId: '995047399971',
    projectId: 'reparin-mobile-9ad64',
    storageBucket: 'reparin-mobile-9ad64.appspot.com',
  );

}