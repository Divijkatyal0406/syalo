import 'package:flutter/material.dart';
import 'package:syalo/screens/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
      home: const LoginPage(),
    );
  }
}
