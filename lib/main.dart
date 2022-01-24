import 'package:flutter/material.dart';
import 'package:syalo/screens/home_screen.dart';

void main() {
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
      home: const HomeScreen(),
    );
  }
}
