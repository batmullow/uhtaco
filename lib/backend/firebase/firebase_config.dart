import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBzsJf2UUtTrEC4yfVHGJjWJTJG-q_zmEk",
            authDomain: "tacos-4b6e7.firebaseapp.com",
            projectId: "tacos-4b6e7",
            storageBucket: "tacos-4b6e7.appspot.com",
            messagingSenderId: "547910979291",
            appId: "1:547910979291:web:4d8af5a258c82c4d17c6fe"));
  } else {
    await Firebase.initializeApp();
  }
}
