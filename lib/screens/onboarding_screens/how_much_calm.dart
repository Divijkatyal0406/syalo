import 'package:flutter/material.dart';
import 'package:syalo/screens/onboarding_screens/selections.dart';

class CalmMindScreen extends StatelessWidget {
  CalmMindScreen({Key? key}) : super(key: key);

  List<String> levels = [
    'I\'m Buddhist',
    'I\'m calm',
    'Okayish',
    'Easily Troubled',
    'Very Irritable',
  ];
  String title = "How Calm is your Mind?";
  String tag = "Calm Mind";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BaseSelection(tag: tag, title: title, items: levels),
      ),
    );
  }
}
