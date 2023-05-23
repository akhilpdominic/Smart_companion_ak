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
    apiKey: 'AIzaSyDDFdCOE__9nZR8KOOD2Wqhy1jgBNvPGVI',
    appId: '1:769355333776:web:e6d12564a97c0ddc179815',
    messagingSenderId: '769355333776',
    projectId: 'smart-study-companion',
    authDomain: 'smart-study-companion.firebaseapp.com',
    databaseURL: 'https://smart-study-companion-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'smart-study-companion.appspot.com',
    measurementId: 'G-R8ZYMSMD8G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAiJp5pBkojCma5xAy7nr8xVGz9Awp_mkM',
    appId: '1:769355333776:android:1a15ff042665a416179815',
    messagingSenderId: '769355333776',
    projectId: 'smart-study-companion',
    databaseURL: 'https://smart-study-companion-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'smart-study-companion.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDuRJjYeRZR21W0aw6H8dvKF0z2uGUgkLE',
    appId: '1:769355333776:ios:57eb274ce18bfaab179815',
    messagingSenderId: '769355333776',
    projectId: 'smart-study-companion',
    databaseURL: 'https://smart-study-companion-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'smart-study-companion.appspot.com',
    iosClientId: '769355333776-89ecm5bndqu2kpbkm176rhejau4flf9e.apps.googleusercontent.com',
    iosBundleId: 'com.example.studyManage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDuRJjYeRZR21W0aw6H8dvKF0z2uGUgkLE',
    appId: '1:769355333776:ios:57eb274ce18bfaab179815',
    messagingSenderId: '769355333776',
    projectId: 'smart-study-companion',
    databaseURL: 'https://smart-study-companion-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'smart-study-companion.appspot.com',
    iosClientId: '769355333776-89ecm5bndqu2kpbkm176rhejau4flf9e.apps.googleusercontent.com',
    iosBundleId: 'com.example.studyManage',
  );
}
