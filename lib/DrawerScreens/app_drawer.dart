import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../habbits/habbitHome.dart';
import '../journals/journalHome.dart';
import '../songTracks/homePage.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Container(
              width: 500,
              margin: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, ${FirebaseAuth.instance.currentUser!.displayName!.split(' ')[0]}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 28,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  const Text(
                    'Conquer the day!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 16,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Material(
                    elevation: 10,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Container(
                      height: 52.0,
                      width: 52.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/sounds.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HabbitScreen()));
                  },
                  child: Material(
                    elevation: 10,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Container(
                      height: 52.0,
                      width: 52.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/habbit.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Material(
                    elevation: 10,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Container(
                      height: 52,
                      width: 52,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/meditate.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JournalScreen()));
                  },
                  child: Material(
                    elevation: 10,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Container(
                      height: 52,
                      width: 52,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/journal.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
