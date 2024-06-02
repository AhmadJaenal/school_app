import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyAEi5AGkzZpzft1TL-N_Zc_5TYzcqAaUZo',
    appId: '1:260012364833:web:2ec26627d3b2ccbfe23f60',
    messagingSenderId: '260012364833',
    projectId: 'ceksekolah-25fde',
    authDomain: 'ceksekolah-25fde.firebaseapp.com',
    storageBucket: 'ceksekolah-25fde.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgeJ_xF9vbEF2y7W9x2UPElbR00pwyX5Y',
    appId: '1:260012364833:android:94efb85f8d99a7cee23f60',
    messagingSenderId: '260012364833',
    projectId: 'ceksekolah-25fde',
    storageBucket: 'ceksekolah-25fde.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzJ6qycMKsYcfVgiqAxc_MtOoAH0lSapo',
    appId: '1:260012364833:ios:7352cd61c7b9f7c4e23f60',
    messagingSenderId: '260012364833',
    projectId: 'ceksekolah-25fde',
    storageBucket: 'ceksekolah-25fde.appspot.com',
    iosBundleId: 'com.example.schoolApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDzJ6qycMKsYcfVgiqAxc_MtOoAH0lSapo',
    appId: '1:260012364833:ios:7352cd61c7b9f7c4e23f60',
    messagingSenderId: '260012364833',
    projectId: 'ceksekolah-25fde',
    storageBucket: 'ceksekolah-25fde.appspot.com',
    iosBundleId: 'com.example.schoolApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAEi5AGkzZpzft1TL-N_Zc_5TYzcqAaUZo',
    appId: '1:260012364833:web:df386cd70695bf17e23f60',
    messagingSenderId: '260012364833',
    projectId: 'ceksekolah-25fde',
    authDomain: 'ceksekolah-25fde.firebaseapp.com',
    storageBucket: 'ceksekolah-25fde.appspot.com',
  );
}
