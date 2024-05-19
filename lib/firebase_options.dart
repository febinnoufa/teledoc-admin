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
    apiKey: 'AIzaSyDnyyM0QZzxL5bcbqLL34vcK3_6Nkw4jrQ',
    appId: '1:1057168250517:web:28323a470d378e5b64ad9c',
    messagingSenderId: '1057168250517',
    projectId: 'tele-doc-ed764',
    authDomain: 'tele-doc-ed764.firebaseapp.com',
    storageBucket: 'tele-doc-ed764.appspot.com',
    measurementId: 'G-LD1MZ4WL2F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHPB8HjPsxaRN8BQDCbrGQyxlGDG0nxJY',
    appId: '1:1057168250517:android:4ebe66e5336a5c6a64ad9c',
    messagingSenderId: '1057168250517',
    projectId: 'tele-doc-ed764',
    storageBucket: 'tele-doc-ed764.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBGlYnq7kLUn_KNV8lEyJFlbeyt_RclUpc',
    appId: '1:1057168250517:ios:bbc44cdbce11e0ef64ad9c',
    messagingSenderId: '1057168250517',
    projectId: 'tele-doc-ed764',
    storageBucket: 'tele-doc-ed764.appspot.com',
    iosClientId: '1057168250517-rpjgvpjqjo2k2grvd75flftimmd4cdev.apps.googleusercontent.com',
    iosBundleId: 'com.example.teledocadmin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBGlYnq7kLUn_KNV8lEyJFlbeyt_RclUpc',
    appId: '1:1057168250517:ios:bbc44cdbce11e0ef64ad9c',
    messagingSenderId: '1057168250517',
    projectId: 'tele-doc-ed764',
    storageBucket: 'tele-doc-ed764.appspot.com',
    iosClientId: '1057168250517-rpjgvpjqjo2k2grvd75flftimmd4cdev.apps.googleusercontent.com',
    iosBundleId: 'com.example.teledocadmin',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDnyyM0QZzxL5bcbqLL34vcK3_6Nkw4jrQ',
    appId: '1:1057168250517:web:59742630c9ffbfeb64ad9c',
    messagingSenderId: '1057168250517',
    projectId: 'tele-doc-ed764',
    authDomain: 'tele-doc-ed764.firebaseapp.com',
    storageBucket: 'tele-doc-ed764.appspot.com',
    measurementId: 'G-H1JKKB46N8',
  );
}