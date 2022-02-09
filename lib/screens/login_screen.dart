import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:syalo/screens/mainframe.dart';

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}


class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            child: const Text("Sign In with Google"),
            onPressed: () async {
              if(FirebaseAuth.instance.currentUser!=null) {
              Navigator.push(context,MaterialPageRoute(builder: (context) => MainFrame()),);
              }
              else {
                await signInWithGoogle();
                if(FirebaseAuth.instance.currentUser!=null) {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => MainFrame()),);
                }
              }
            },
          ),
        ),
        Center(
          child: ElevatedButton(
            child: const Text("Sign Out"),
            onPressed: () async {
                await GoogleSignIn().signOut();
                await FirebaseAuth.instance.signOut();
                if(FirebaseAuth.instance.currentUser==null) {
                  print("Signed Out");
                }
                else {
                  print("Sign Out Failed");
                }
              },
          ),
        ),
      ]
    );
  }
}