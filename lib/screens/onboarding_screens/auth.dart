// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_firebase/easy_firebase.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syalo/screens/onboarding_screens/lets_win.dart';
import 'package:syalo/screens/onboarding_screens/transitions.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "Helping 8 Billion People",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "SELF-ACTUALIZE",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * .7,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: height * .35,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/onboarding/welcome.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: height * .35,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/onboarding/auth.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            OutlinedButton.icon(
                style: ButtonStyle(
                    side: MaterialStateProperty.all(BorderSide(
                      width: 1,
                      color: Colors.blue,
                    )),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        vertical: 16, horizontal: width * .20))),
                onPressed: () async {
                  // print("Connect me with firebase to signin"); //TODO
                  try {
                    await EasyFire().getAuthObject().signInWithGoogle();
                  } catch (e) {
                    print(e);
                  }

                  Navigator.of(context).pushReplacement(PageTransition(
                      child: LetsWinScreen(),
                      type: PageTransitionType.rightToLeft));
                },
                icon: FaIcon(FontAwesomeIcons.google),
                label: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text("Sign in with Google"),
                )),
          ],
        ),
      ),
    );
  }
}
