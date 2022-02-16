import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syalo/widgets/main_screen_widgets/home_screen_widgets/habit_container.dart';
import 'package:syalo/widgets/main_screen_widgets/home_screen_widgets/home_screen_round_button.dart';
import 'package:syalo/widgets/main_screen_widgets/profile_screen_widgets/habit_chart.dart';


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
          actions: [Text("Refer",style: TextStyle(color: Colors.black),)],
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
                    ClassifyButtons(imageUrl: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643262032/HomeScreen%20and%20Icons/meditate_icon_d0ixey.svg"),
                    ClassifyButtons(imageUrl: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643262032/HomeScreen%20and%20Icons/meditate_icon_d0ixey.svg"),
                    ClassifyButtons(imageUrl: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643262032/HomeScreen%20and%20Icons/meditate_icon_d0ixey.svg"),
                    ClassifyButtons(imageUrl: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643262032/HomeScreen%20and%20Icons/meditate_icon_d0ixey.svg"),
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
