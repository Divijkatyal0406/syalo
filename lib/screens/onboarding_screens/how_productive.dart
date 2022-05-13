import 'package:flutter/material.dart';
import 'package:syalo/screens/onboarding_screens/selections.dart';

class ProductiveScreen extends StatelessWidget {
  ProductiveScreen({Key? key}) : super(key: key);

  List<String> levels = [
    'Elon Musk',
    'I\'m Good',
    'I get my Work Done',
    'Not Good',
    'I Struggle',
  ];
  String title = "How Productive are you?";
  String tag = "Productive";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BaseSelection(tag: tag, title: title, items: levels),
      ),
    );
  }
}
