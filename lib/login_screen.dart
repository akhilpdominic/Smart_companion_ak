import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleSignInAccount!.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      // Handle sign-in error
      print('Sign-in with Google failed: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _signInWithGoogle().then((userCredential) {
                  if (userCredential != null) {
                    // Handle successful sign-in
                    print('Successfully signed in with Google. User: ${userCredential.user}');
                  }
                });
              },
              child: Text('Sign in with Google'),
            ),
            SizedBox(height: 16),
            // Add other sign-in options here
            // For example, a button to sign in with email and password
            ElevatedButton(
              onPressed: () {
                // Handle sign-in with email and password
              },
              child: Text('Sign in with Email'),
            ),
            // You can add more buttons for other sign-in providers as needed
          ],
        ),
      ),
    );
  }
}