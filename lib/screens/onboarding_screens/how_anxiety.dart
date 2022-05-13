import 'package:flutter/material.dart';
import 'package:syalo/screens/onboarding_screens/selections.dart';

class AnxietyScreen extends StatelessWidget {
  AnxietyScreen({Key? key}) : super(key: key);

  List<String> levels = [
    'I\'m Buddhist',
    'Not Often',
    '3 Times a Week',
    'Daily',
    'More Than Once a day',
  ];
  String title = "How often do you have Anxiety?";
  String tag = "Anxiety";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BaseSelection(tag: tag, title: title, items: levels),
      ),
    );
  }
}
