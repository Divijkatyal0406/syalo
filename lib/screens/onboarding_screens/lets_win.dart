import 'package:flutter/material.dart';
import 'package:syalo/screens/onboarding_screens/default_mood_selection.dart';
import 'package:syalo/screens/onboarding_screens/transitions.dart';

class LetsWinScreen extends StatelessWidget {
  const LetsWinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Human are entirely',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                "Creatures of Habits",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: height * .35,
            width: double.infinity,
            child: Image.asset(
              "assets/onboarding/welcome.png",
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Column(
                  children: const [
                    Text(
                      "Lets make you",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Phenominal!",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                      PageTransition(
                          child: DefaultMoodScreen(),
                          type: PageTransitionType.rightToLeft)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * .20, vertical: 12),
                    child: const Text(
                      "Let's Win 🔥️",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
