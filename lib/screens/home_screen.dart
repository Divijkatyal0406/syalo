import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syalo/DrawerScreens/favourites.dart';
import 'package:syalo/DrawerScreens/habits_main.dart';
import 'package:syalo/DrawerScreens/journal_main.dart';
import 'package:syalo/model/drawer_button.dart';
import 'package:syalo/widgets/app_wide_widgets/classify_list.dart';
import 'package:syalo/widgets/main_screen_widgets/home_screen_widgets/habit_container.dart';
import 'package:syalo/widgets/main_screen_widgets/home_screen_widgets/home_screen_round_button.dart';
import 'package:syalo/widgets/main_screen_widgets/home_screen_widgets/screen_nav_containers.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var ref=FirebaseAuth.instance.currentUser;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [Text("Refer")],
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
                  SizedBox(height: 4,),
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
                    onTap: () {

                    },
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
                      onTap: () {
                      },
                      child:
                          const DrawerButton(text: 'Settings', icon: Icons.settings)),
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
                    Image.asset("assets/images/home_screen_bg.png",fit: BoxFit.cover,),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Hi ! ${ref.displayName!.split(' ')[0]}",
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(
                                  188, 188, 188, 0.25),
                              offset: Offset(10, 10),
                              blurRadius: 20)
                        ],
                        color:
                            Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.all(
                            Radius.elliptical(70, 70)),
                      ),
                      child: const Icon(
                        FontAwesomeIcons.bookOpen,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(
                                  188, 188, 188, 0.25),
                              offset: Offset(10, 10),
                              blurRadius: 20)
                        ],
                        color:
                            Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.all(
                            Radius.elliptical(70, 70)),
                      ),
                      child: const Icon(
                        FontAwesomeIcons.globe,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(
                                  188, 188, 188, 0.25),
                              offset: Offset(10, 10),
                              blurRadius: 20)
                        ],
                        color:
                            Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.all(
                            Radius.elliptical(70, 70)),
                      ),
                      child: const Icon(
                        FontAwesomeIcons.stethoscope,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(
                                  188, 188, 188, 0.25),
                              offset: Offset(10, 10),
                              blurRadius: 20)
                        ],
                        color:
                            Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.all(
                            Radius.elliptical(70, 70)),
                      ),
                      child: const Icon(
                        FontAwesomeIcons.stopwatch,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(onTap: (){},child: ClassifyButtons(imageUrl: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643262032/HomeScreen%20and%20Icons/meditate_icon_d0ixey.svg")),
                    GestureDetector(onTap: (){},child: ClassifyButtons(imageUrl: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643262032/HomeScreen%20and%20Icons/meditate_icon_d0ixey.svg")),
                    GestureDetector(onTap: (){},child: ClassifyButtons(imageUrl: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643262032/HomeScreen%20and%20Icons/meditate_icon_d0ixey.svg")),
                    GestureDetector(onTap: (){},child: ClassifyButtons(imageUrl: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643262032/HomeScreen%20and%20Icons/meditate_icon_d0ixey.svg")),
                  ],
                ),
              ),
              const HabitContainer(),
              const SizedBox(height: 10.0,),
              ClassifyList(title: "Discover Sounds"),
              const SizedBox(height: 10,),
              const ScreenNavContainers(
                image: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643014082/HomeScreen%20and%20Icons/habits_hs_b3wig5.png",
                title: "Habits",
              ),
              const ScreenNavContainers(
                image: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643014082/HomeScreen%20and%20Icons/support_group_hs_czudpi.png",
                title: "Support Groups",
              ),
              const SizedBox(height: 10,),
              ClassifyList(title: "Discover Paths"),
              const SizedBox(height: 10,),
              const ScreenNavContainers(
                image: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643014079/HomeScreen%20and%20Icons/appointments_hs_jl7hb8.png",
                title: "Appointments",
              ),
              const ScreenNavContainers(
                image: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643014080/HomeScreen%20and%20Icons/brain_games_hs_mqsuua.png",
                title: "Brain Games",
              ),

            ],
          ),
        ));
  }
}
