import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:syalo/DrawerScreens/habits_main.dart';
import 'package:syalo/DrawerScreens/journal_main.dart';
import 'package:syalo/model/drawer_button.dart';
import 'package:syalo/screens/songs_screen/all_songs.dart';
import 'package:syalo/songTracks/homePage.dart';
import 'package:syalo/widgets/app_wide_widgets/classify_list.dart';
import 'package:syalo/widgets/main_screen_widgets/home_screen_widgets/habit_container.dart';
import 'package:syalo/widgets/main_screen_widgets/home_screen_widgets/home_screen_round_button.dart';
import 'package:syalo/widgets/main_screen_widgets/home_screen_widgets/screen_nav_containers.dart';

import '../habbits/habbitHome.dart';
import '../journals/journalHome.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ref = FirebaseAuth.instance.currentUser;
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 10,
          // actions: [
          //     Padding(padding: EdgeInsets.all(10),child: Text("Refer",style: TextStyle(fontWeight: FontWeight.bold),)),
          //   ],
        ),
        extendBodyBehindAppBar: true,
        drawer: Drawer(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Container(
                  width: 500,
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, ${ref!.displayName!.split(' ')[0]}',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 28,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                      SizedBox(
                        height: 4,
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
                SizedBox(height: 50),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const DrawerButton(
                            text: 'Appointment',
                            icon: Icons.calendar_today_outlined),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HabitsMain(),
                            ),
                          );
                        },
                        child: const DrawerButton(
                            text: 'Habits & Logs', icon: Icons.timelapse_sharp),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JournalMain(),
                              ),
                            );
                          },
                          child: const DrawerButton(
                              text: 'Journal', icon: Icons.book_sharp)),
                      // InkWell(
                      //     onTap: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => Favourite(),
                      //         ),
                      //       );
                      //     },
                      // child: const DrawerButton(
                      //     text: 'Favourites', icon: Icons.favorite)),
                      InkWell(
                          onTap: () {},
                          child: const DrawerButton(
                              text: 'Settings', icon: Icons.settings)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Image(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/home_screen_bg.png',
                        // height: 400,
                        // fit:BoxFit.fitWidth,
                      ),
                    ),
                    // Image.asset("assets/images/home_screen_bg.png",fit: BoxFit.cover,),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.32,
                            top: MediaQuery.of(context).size.height / 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Hello, ${FirebaseAuth.instance.currentUser!.displayName!.split(' ')[0]}",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Text(
                              "Conquer the day!",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Column(
                        children: [
                          Material(
                            elevation: 10,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            child: Container(
                              height: 52.0,
                              width: 52.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/sounds.png'),
                                  // fit: BoxFit.fill,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          SizedBox(height:10),
                          Text('Sounds')
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HabbitScreen()));
                      },
                      child: Column(
                        children: [
                          Material(
                            elevation: 10,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            child: Container(
                              height: 52.0,
                              width: 52.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/habbit.png'),
                                  // fit: BoxFit.fill,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          SizedBox(height:10),
                          Text('Habit')
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JournalScreen()));
                      },
                      child: Column(
                        children: [
                          Material(
                            elevation: 10,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            child: Container(
                              height: 52,
                              width: 52,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage('assets/meditate.png'),
                                  alignment: Alignment.center,
                                  centerSlice: Rect.zero,
                                  scale: 1.2,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          SizedBox(height:10),
                          Text('Journal')
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JournalScreen()));
                      },
                      child: Column(
                        children: [
                          Material(
                            elevation: 10,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            child: Container(
                              padding: EdgeInsets.all(50),
                              height: 52,
                              width: 52,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/learn_path.png'),
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          SizedBox(height:10),
                          Text('Learn')
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              HabitContainer(),
              SizedBox(
                height: 15.0,
              ),
              ClassifyList(title: "Discover Sounds"),
              SizedBox(
                height: 15,
              ),

              GestureDetector(
                onTap: ()=>{
                  HabbitScreen()
                },
                child:Material(
                  elevation: 10,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Container(
                    alignment: Alignment.center,
                    height: 350,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/habbit_card.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      // shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),

              // const ScreenNavContainers(
              //   image: 'https://s3.envato.com/files/227729934/syda_0215969.jpg',
              //   title: "Habits",
              // ),
              SizedBox(
                height: 15.0,
              ),
              // const ScreenNavContainers(
              //   image:
              //       "https://www.thiscaringhome.org/wp-content/uploads/2018/06/Support-Group.jpeg",
              //   title: "Support Groups",
              // ),
              GestureDetector(
                onTap: ()=>{
                  // HabbitScreen()
                },
                child:Material(
                  elevation: 10,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Container(
                    alignment: Alignment.center,
                    height: 350,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/support_card.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      // shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ClassifyList(title: "Discover Paths"),
              SizedBox(
                height: 10,
              ),
              // const ScreenNavContainers(
              //   image:
              //       "https://cdn.lifehack.org/wp-content/uploads/2013/06/doctor-appointment.jpg",
              //   title: "Appointments",
              // ),
              GestureDetector(
                onTap: ()=>{
                  // HabbitScreen()
                },
                child:Material(
                  elevation: 10,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Container(
                    alignment: Alignment.center,
                    height: 350,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/appointment_card.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      // shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // const ScreenNavContainers(
              //   image:
              //       "https://content.thriveglobal.com/wp-content/uploads/2019/06/innovation-LIGHT-BULB-iStock-1023387542.jpg",
              //   title: "Brain Games",
              // ),
              GestureDetector(
                onTap: ()=>{
                  JournalScreen()
                },
                child:Material(
                  elevation: 10,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Container(
                    alignment: Alignment.center,
                    height: 350,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/journal_card.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      // shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: ()=>{
                  // JournalScreen()
                },
                child:Material(
                  elevation: 10,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Container(
                    alignment: Alignment.center,
                    height: 350,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/brain_card.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      // shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
