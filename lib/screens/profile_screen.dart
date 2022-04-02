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
    var photo;
    var ref = FirebaseAuth.instance.currentUser;
    if(ref!=null)
    {
    photo=ref.photoURL;}
    else
    {photo="";}
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          //actions: [Text("Refer",style: TextStyle(color: Colors.black),)],
        ),
        extendBodyBehindAppBar: true,
        drawer: Drawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(photo),
                ),
                SizedBox(height: 10.0,),
                Text("${ref!.displayName}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                SizedBox(height: 20.0,),
                Row(
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
                SizedBox(height: 20.0,),
                HabitContainer(),
                SizedBox(height: 20.0,),
                Container(
                    height: 300,
                    width: 600,
                    child: HabitChart())
              ],
            ),
          ),
        )
    );
  }
}
