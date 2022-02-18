import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [Text("Refer")],
        ),
        extendBodyBehindAppBar: true,
        drawer: Drawer(),
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
                        "Hi ! ${FirebaseAuth.instance.currentUser!.displayName!.split(' ')[0]}",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                // padding: EdgeInsets.only(top: 10),
                // height: MediaQuery.of(context).size.height * 0.2,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      child: Material(
                        elevation:10,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Container(
                          height: 52.0,
                          width: 52.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/sounds.png'),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HabbitScreen()));
                      },
                      child: Material(
                        elevation:10,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Container(
                          height: 52.0,
                          width: 52.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/habbit.png'),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      },
                      child: Material(
                        elevation:10,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/meditate.png'),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => JournalScreen()));
                      },
                      child: Material(
                        elevation:10,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/journal.png'),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              HabitContainer(),
              SizedBox(height: 10.0,),
              ClassifyList(title: "Discover Sounds"),
              SizedBox(height: 10,),
              const ScreenNavContainers(
                image:'https://s3.envato.com/files/227729934/syda_0215969.jpg',
                title: "Habits",
              ),
              const ScreenNavContainers(
                image: "https://www.thiscaringhome.org/wp-content/uploads/2018/06/Support-Group.jpeg",
                title: "Support Groups",
              ),
              SizedBox(height: 10,),
              ClassifyList(title: "Discover Paths"),
              SizedBox(height: 10,),
              const ScreenNavContainers(
                image: "https://cdn.lifehack.org/wp-content/uploads/2013/06/doctor-appointment.jpg",
                title: "Appointments",
              ),
              const ScreenNavContainers(
                image: "https://content.thriveglobal.com/wp-content/uploads/2019/06/innovation-LIGHT-BULB-iStock-1023387542.jpg",
                title: "Brain Games",
              ),

            ],
          ),
        ));
  }
}
