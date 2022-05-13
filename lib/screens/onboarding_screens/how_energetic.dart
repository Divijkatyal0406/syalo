import 'package:flutter/material.dart';
import 'package:syalo/screens/onboarding_screens/selections.dart';

class EnergeticScreen extends StatelessWidget {
  EnergeticScreen({Key? key}) : super(key: key);

  List<String> levels = [
    'Super Energetic',
    'Very Energetic',
    'Okish',
    'Not so Much',
    'Lethargic',
  ];
  String title = "How Energetic are you?";
  String tag = "Energetic";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BaseSelection(tag: tag, title: title, items: levels),
      ),
    );
  }
}
