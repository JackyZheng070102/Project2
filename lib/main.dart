import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth_screen.dart';  // Create a screen to handle Authentication

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Auth',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AuthScreen(),  // Set AuthScreen as the home screen
    );
  }
}
