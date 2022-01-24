import 'package:flutter/material.dart';
import 'package:syalo/widgets/app_wide_widgets/classify_list.dart';
import 'package:syalo/widgets/main_screen_widgets/home_screen_widgets/habit_container.dart';
import 'package:syalo/widgets/main_screen_widgets/home_screen_widgets/home_screen_round_button.dart';
import 'package:syalo/widgets/main_screen_widgets/home_screen_widgets/screen_nav_containers.dart';

class HomeScreen extends StatelessWidget {
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
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.center,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ClassifyButtons(imageUrl: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643014280/HomeScreen%20and%20Icons/meditate_icon_dhtgbg.png"),
                    ClassifyButtons(imageUrl: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643014280/HomeScreen%20and%20Icons/meditate_icon_dhtgbg.png"),
                    ClassifyButtons(imageUrl: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643014280/HomeScreen%20and%20Icons/meditate_icon_dhtgbg.png"),
                    ClassifyButtons(imageUrl: "https://res.cloudinary.com/dhrju5vsa/image/upload/v1643014280/HomeScreen%20and%20Icons/meditate_icon_dhtgbg.png"),
                  ],
                ),
              ),
              HabitContainer(),
              SizedBox(height: 10.0,),
              ClassifyList(title: "Discover Sounds"),
              ClassifyList(title: "Discover Paths"),
              Container(
                height: MediaQuery.of(context).size.height *0.5,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  children: [
                    ScreenNavContainers(),
                    ScreenNavContainers(),
                    ScreenNavContainers(),
                    ScreenNavContainers(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
