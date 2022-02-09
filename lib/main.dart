import 'package:flutter/material.dart';
import 'package:syalo/screens/login_signup.dart';
import 'package:firebase_core/firebase_core.dart';

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
      title: 'Syalo',
      theme: ThemeData(
      ),
      home: LoginSignupScreen(),
    );
  }
}
