import 'package:flutter/material.dart';
import 'package:syalo/screens/onboarding_screens/selections.dart';

class DefaultMoodScreen extends StatelessWidget {
  DefaultMoodScreen({Key? key}) : super(key: key);

  List<String> moods = [
    'Blissful',
    'Pleasant',
    'Neutral',
    'OK',
    'Miserable',
  ];
  String title = "How is your Default Mood? ";
  String tag = "Default Mood";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BaseSelection(tag: tag, title: title, items: moods),
      ),
    );
  }
}
