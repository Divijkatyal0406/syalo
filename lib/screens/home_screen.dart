import 'package:flutter/material.dart';
import 'package:syalo/widgets/app_wide_widgets/classify_list.dart';
import 'package:syalo/widgets/main_screen_widgets/home_screen_widgets/habit_container.dart';
import 'package:syalo/widgets/main_screen_widgets/home_screen_widgets/home_screen_round_button.dart';
import 'package:syalo/widgets/main_screen_widgets/home_screen_widgets/screen_nav_containers.dart';

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
                        "Hi ! Shreyas",
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
                height: MediaQuery.of(context).size.height * 0.2,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClassifyButtons(imageUrl: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643262032/HomeScreen%20and%20Icons/meditate_icon_d0ixey.svg"),
                    ClassifyButtons(imageUrl: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643262032/HomeScreen%20and%20Icons/meditate_icon_d0ixey.svg"),
                    ClassifyButtons(imageUrl: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643262032/HomeScreen%20and%20Icons/meditate_icon_d0ixey.svg"),
                    ClassifyButtons(imageUrl: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643262032/HomeScreen%20and%20Icons/meditate_icon_d0ixey.svg"),
                  ],
                ),
              ),
              HabitContainer(),
              SizedBox(height: 10.0,),
              ClassifyList(title: "Discover Sounds"),
              SizedBox(height: 10,),
              const ScreenNavContainers(
                image: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643014082/HomeScreen%20and%20Icons/habits_hs_b3wig5.png",
                title: "Habits",
              ),
              const ScreenNavContainers(
                image: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643014082/HomeScreen%20and%20Icons/support_group_hs_czudpi.png",
                title: "Support Groups",
              ),
              SizedBox(height: 10,),
              ClassifyList(title: "Discover Paths"),
              SizedBox(height: 10,),
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
