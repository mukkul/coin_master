import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if(kIsWeb){
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'Firebase option is not configured for this platform',
        );
      default:
        throw UnsupportedError('');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyCUyRknubnkwtRkbsibkEIEDKtzhTFgipM",
    authDomain: "coin-master-2f2e8.firebaseapp.com",
    projectId: "coin-master-2f2e8",
    storageBucket: "coin-master-2f2e8.appspot.com",
    messagingSenderId: "818648632114",
    appId: "1:818648632114:web:8f011d480ce75a0b34652b",
    measurementId: "G-B0DQTNEJK3"
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyC-N3Magt5MCIVNpfv3obA6cDZikIOpKc4",
    projectId: "coin-master-2f2e8",
    storageBucket: "coin-master-2f2e8.appspot.com",
    messagingSenderId: "818648632114",
    appId: "1:818648632114:web:8f011d480ce75a0b34652b",
    measurementId: "G-B0DQTNEJK3"
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-N3Magt5MCIVNpfv3obA6cDZikIOpKc4',
    appId: '1:818648632114:ios:812777e3fcc1128734652b',
    messagingSenderId: '267621253497',
    projectId: "coin-master-2f2e8",
    storageBucket: "coin-master-2f2e8.appspot.com",
  );

}
