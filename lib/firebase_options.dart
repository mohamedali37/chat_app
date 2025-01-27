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
    apiKey: 'AIzaSyCOX7Tp5Gy78YpGO3E-Uj2krZZv5W0Et7U',
    appId: '1:32060790467:web:ee634333c08d33c18f3476',
    messagingSenderId: '32060790467',
    projectId: 'chat-app-ffa4d',
    authDomain: 'chat-app-ffa4d.firebaseapp.com',
    storageBucket: 'chat-app-ffa4d.appspot.com',
    measurementId: 'G-RSFY2D0GE2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDN1HeyBJ4sgyLgTR7NQhlp4lESr8dglDg',
    appId: '1:32060790467:android:6117235e4ba9e3188f3476',
    messagingSenderId: '32060790467',
    projectId: 'chat-app-ffa4d',
    storageBucket: 'chat-app-ffa4d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_3Qs1gCTNVTRhIPK-bFm48XKok5YX5WY',
    appId: '1:32060790467:ios:6443a7febcf3a2668f3476',
    messagingSenderId: '32060790467',
    projectId: 'chat-app-ffa4d',
    storageBucket: 'chat-app-ffa4d.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_3Qs1gCTNVTRhIPK-bFm48XKok5YX5WY',
    appId: '1:32060790467:ios:6443a7febcf3a2668f3476',
    messagingSenderId: '32060790467',
    projectId: 'chat-app-ffa4d',
    storageBucket: 'chat-app-ffa4d.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCOX7Tp5Gy78YpGO3E-Uj2krZZv5W0Et7U',
    appId: '1:32060790467:web:082f649e245147168f3476',
    messagingSenderId: '32060790467',
    projectId: 'chat-app-ffa4d',
    authDomain: 'chat-app-ffa4d.firebaseapp.com',
    storageBucket: 'chat-app-ffa4d.appspot.com',
    measurementId: 'G-MC00748QEH',
  );

}