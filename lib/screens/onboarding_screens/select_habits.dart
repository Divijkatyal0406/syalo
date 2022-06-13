// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syalo/screens/habits_screen/define_habits.dart';
import 'package:syalo/screens/mainframe.dart';

class SelectHabits extends StatefulWidget {
  bool? firstPage;
  SelectHabits({Key? key, this.firstPage}) : super(key: key);

  @override
  _SelectHabitsState createState() => _SelectHabitsState();
}

class _SelectHabitsState extends State<SelectHabits> {
  List habits = [
    {
      "name": "No Habit",
      "imageUrl":
          "https://media.istockphoto.com/photos/my-presence-is-my-power-picture-id1303002202?s=612x612"
    }
  ];
  //   {
  //     'name': "Yoga",
  //     'imageURL':
  //         "https://media.istockphoto.com/photos/my-presence-is-my-power-picture-id1303002202?s=612x612"
  //   },
  //   {
  //     'name': "Yoga1",
  //     'imageURL':
  //         "https://cdn.pixabay.com/photo/2014/12/16/22/25/sunset-570881_960_720.jpg",
  //   },
  //   {
  //     'name': "Yoga2",
  //     'imageURL':
  //         "https://cdn.pixabay.com/photo/2016/11/29/09/49/woman-1868817_960_720.jpg"
  //   },
  //   {
  //     'name': "Yoga3",
  //     'imageURL':
  //         "https://media.istockphoto.com/photos/my-presence-is-my-power-picture-id1303002202?s=612x612",
  //   },
  //   {
  //     'name': "Yoga4",
  //     'imageURL':
  //         "https://media.istockphoto.com/photos/my-presence-is-my-power-picture-id1303002202?s=612x612"
  //   },
  //   {
  //     'name': "Yoga5",
  //     'imageURL':
  //         "https://cdn.pixabay.com/photo/2013/05/11/08/28/sunset-110305_960_720.jpg",
  //   },
  //   {
  //     'name': "Yoga6",
  //     'imageURL':
  //         "https://media.istockphoto.com/photos/my-presence-is-my-power-picture-id1303002202?s=612x612"
  //   },
  //   {
  //     'name': "Yoga7",
  //     'imageURL':
  //         "https://cdn.pixabay.com/photo/2015/01/07/15/51/woman-591576_960_720.jpg",
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Add Habits",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          // actions: widget.firstPage == true
          //     ? []
          //     : [
          //         TextButton(
          //             onPressed: () => Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (_) => OngoingHabits())),
          //             child: Text("My Habits"))
          //       ],
        ),
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              top: 0,
              child: SizedBox(
                height: height,
                width: width,
                child: GridView.count(
                  // shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: [
                    for (int i = 0; i < habits.length; i++)
                      gridTile(height, width, habits[i]),
                    Container()
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: width * .3, vertical: 18.0)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                    ),
                    onPressed: () {
                      widget.firstPage == true
                          ? Navigator.push(context,
                              MaterialPageRoute(builder: (_) => MainFrame()))
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      HabitsDescription(habitName: "")));
                      // TODO: Navigate to home page after atleast 3 selection
                      //                 },
                      //                 child: Text("Create My Own")),
                    },
                    child: widget.firstPage == true
                        ? Text("Go to Home")
                        : Text("Create my own"),
                  )),
            )
          ],
        ));
  }

  Widget gridTile(double height, double width, Map habit) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => HabitsDescription(habitName: habit['name']!))),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(children: [
            SizedBox.expand(
              child: Image.network(
                habit["imageUrl"]!,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                left: 10,
                bottom: 10,
                child: Text(
                  habit["name"]!,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ))
          ]),
        ),
      ),
    );
  }
}
