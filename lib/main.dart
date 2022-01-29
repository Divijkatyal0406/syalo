import 'package:flutter/material.dart';
import 'package:syalo/screens/home_screen.dart';
import 'package:syalo/screens/mainframe.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SyaloApp());
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
  );

class SyaloApp extends StatelessWidget {
  const SyaloApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Syalo',
      theme: ThemeData(
      ),
      home: const MainFrame(),
    );
  }
}
