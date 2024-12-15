import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  String _statusMessage = '';

  // Sign up method
  Future<void> signUp() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      setState(() {
        _statusMessage = 'Sign Up Successful! Welcome, ${userCredential.user?.email}';
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'Sign Up Failed: ${e.toString()}';
      });
    }
  }

  // Sign in method
  Future<void> signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      setState(() {
        _statusMessage = 'Sign In Successful! Welcome, ${userCredential.user?.email}';
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'Sign In Failed: ${e.toString()}';
      });
    }
  }

  // Sign out method
  Future<void> signOut() async {
    await _auth.signOut();
    setState(() {
      _statusMessage = 'You have signed out!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase Authentication')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: signUp,
              child: Text('Sign Up'),
            ),
            ElevatedButton(
              onPressed: signIn,
              child: Text('Sign In'),
            ),
            ElevatedButton(
              onPressed: signOut,
              child: Text('Sign Out'),
            ),
            SizedBox(height: 20),
            Text(_statusMessage), // Display status message (success or failure)
          ],
        ),
      ),
    );
  }
}
