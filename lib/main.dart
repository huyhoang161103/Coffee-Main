import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_2/screens/home_screen.dart';
import 'package:flutter_application_2/screens/sign_in.dart';

import 'screens/firestore_test_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      appId: '1:165852388585:android:c6d7bad678f67d45b1e478',
      apiKey: 'AIzaSyD3X2WdwVTYoyMKC8xxOjEl0FDH1wTJ4CI',
      projectId: 'app-coffee-f13ab',
      messagingSenderId: 'YOUR_SENDER_ID',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF212325),
      ),
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
