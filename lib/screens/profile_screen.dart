import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syalo/widgets/main_screen_widgets/home_screen_widgets/habit_container.dart';
//import 'package:syalo/widgets/main_screen_widgets/home_screen_widgets/home_screen_round_button.dart';
import 'package:syalo/widgets/main_screen_widgets/profile_screen_widgets/habit_chart.dart';

import '../habbits/habbitHome.dart';
import '../journals/journalHome.dart';
import '../songTracks/homePage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String? photo;
    var ref = FirebaseAuth.instance.currentUser;
    if (ref != null) {
      photo = ref.photoURL;
    } else {
      photo = "";
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          //actions: [Text("Refer",style: TextStyle(color: Colors.black),)],
        ),
        extendBodyBehindAppBar: true,
        drawer: const Drawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(photo!),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "${ref!.displayName}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Material(
                        elevation: 10,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Material(
                        elevation: 10,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
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
                const SizedBox(
                  height: 20.0,
                ),
                const HabitContainer(),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(height: 300, width: 600, child: HabitChart())
              ],
            ),
          ),
        ));
  }
}
