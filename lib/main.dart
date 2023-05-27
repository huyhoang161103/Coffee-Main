import 'package:flutter/material.dart';
import 'package:flutter_application_2/firebase_options.dart';
import 'package:flutter_application_2/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/screens/wellcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyD6qO83EaSUMCd1uVNhBJXNT1mhekAxfdM',
      projectId: 'coffeeapp-project',
      databaseURL: 'https://coffeeapp-project-default-rtdb.firebaseio.com',
      messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
      appId: '1:486245911561:android:85c3ed190de1a5fe5fbcd8',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF212325),
      ),
      debugShowCheckedModeBanner: false,
      home: WellcomeScreen(),
    );
  }
}
