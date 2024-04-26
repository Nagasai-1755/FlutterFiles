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
    apiKey: 'AIzaSyDUm6nBusPQQSdp8mN0ydY9g4Z_kPr6UNw',
    appId: '1:382580575312:web:cf147b009f3547544f9555',
    messagingSenderId: '382580575312',
    projectId: 'watchlist-notification',
    authDomain: 'watchlist-notification.firebaseapp.com',
    storageBucket: 'watchlist-notification.appspot.com',
    measurementId: 'G-XJXW802PMX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhAZfNZtXi2sYmLdjj8PRLSVOwBJatdVQ',
    appId: '1:382580575312:android:c2dde9d58198124b4f9555',
    messagingSenderId: '382580575312',
    projectId: 'watchlist-notification',
    storageBucket: 'watchlist-notification.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAN_jMnvojT6Zl0gSD3N5_Vo72HDO3NwNA',
    appId: '1:382580575312:ios:f446a9ee6e1c15924f9555',
    messagingSenderId: '382580575312',
    projectId: 'watchlist-notification',
    storageBucket: 'watchlist-notification.appspot.com',
    iosBundleId: 'com.example.watchlistBloc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAN_jMnvojT6Zl0gSD3N5_Vo72HDO3NwNA',
    appId: '1:382580575312:ios:f446a9ee6e1c15924f9555',
    messagingSenderId: '382580575312',
    projectId: 'watchlist-notification',
    storageBucket: 'watchlist-notification.appspot.com',
    iosBundleId: 'com.example.watchlistBloc',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDUm6nBusPQQSdp8mN0ydY9g4Z_kPr6UNw',
    appId: '1:382580575312:web:40276b610fe52ae94f9555',
    messagingSenderId: '382580575312',
    projectId: 'watchlist-notification',
    authDomain: 'watchlist-notification.firebaseapp.com',
    storageBucket: 'watchlist-notification.appspot.com',
    measurementId: 'G-9N0PD4PDS5',
  );
}