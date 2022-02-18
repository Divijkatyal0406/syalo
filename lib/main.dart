import 'package:flutter/material.dart';
import 'package:syalo/screens/login_signup.dart';
import 'package:syalo/habbits/habbitHome.dart';
import 'package:syalo/screens/home_screen.dart';
import 'package:syalo/screens/mainframe.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:syalo/screens/onboarding_video.dart';
import 'package:syalo/songTracks/homePage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SyaloApp());
}

class SyaloApp extends StatelessWidget {
  const SyaloApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SuprSelf',
      // theme: ThemeData(
      // ),
      home: MainFrame(),
      // home: LoginSignupScreen(),
    );
  }
}
