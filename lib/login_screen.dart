import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:study_manage/user_info_page.dart';

class LoginScreen extends StatefulWidget {
  final List<dynamic> drowsyArrayl;
  final List<dynamic> yawnArrayl;
  const LoginScreen(
      {super.key, required this.drowsyArrayl, required this.yawnArrayl});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount!.authentication;
      print("here\n\n\n\n\n\n\n\n\n\n\n\n");

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
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
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
                _signInWithGoogle().then((userCredential) {
                  if (userCredential != null) {
                    // Handle successful sign-in
                    print(
                        '\n\n\n\n\n\n\nSuccessfully signed in with Google. User: ${userCredential.user}');

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserInfoPage(
                                  drowsyArrayu: widget.drowsyArrayl,
                                  yawnArrayu: widget.yawnArrayl,
                                )));
                    /*Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => UserInfoPage(
                              drowsyArrayu: widget.drowsyArrayl,
                              yawnArrayu: widget.yawnArrayl,
                            )));*/
                  }
                });
              },
              child: const Text('Sign in with Google'),
            ),
            const SizedBox(height: 16),
            // Add other sign-in options here
            // For example, a button to sign in with email and password
            // ElevatedButton(
            //   onPressed: () {
            //     // Handle sign-in with email and password
            //   },
            //   child: Text('Sign in with Email'),
            // ),
            // You can add more buttons for other sign-in providers as needed
          ],
        ),
      ),
    );
  }
}
