// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syalo/screens/habits_screen/define_habits.dart';
import 'package:syalo/screens/mainframe.dart'

class SelectHabits extends StatefulWidget {
  const SelectHabits({Key? key}) : super(key: key);

  @override
  _SelectHabitsState createState() => _SelectHabitsState();
}

class _SelectHabitsState extends State<SelectHabits> {
  List<Map<String, String>> habits = [
    {
      'name': "Yoga",
      'imageURL':
          "https://media.istockphoto.com/photos/my-presence-is-my-power-picture-id1303002202?s=612x612"
    },
    {
      'name': "Yoga1",
      'imageURL':
          "https://media.istockphoto.com/photos/my-presence-is-my-power-picture-id1303002202?s=612x612"
    },
    {
      'name': "Yoga2",
      'imageURL':
          "https://media.istockphoto.com/photos/my-presence-is-my-power-picture-id1303002202?s=612x612"
    },
    {
      'name': "Yoga3",
      'imageURL':
          "https://media.istockphoto.com/photos/my-presence-is-my-power-picture-id1303002202?s=612x612"
    },
    {
      'name': "Yoga4",
      'imageURL':
          "https://media.istockphoto.com/photos/my-presence-is-my-power-picture-id1303002202?s=612x612"
    },
    {
      'name': "Yoga5",
      'imageURL':
          "https://media.istockphoto.com/photos/my-presence-is-my-power-picture-id1303002202?s=612x612"
    },
    {
      'name': "Yoga6",
      'imageURL':
          "https://media.istockphoto.com/photos/my-presence-is-my-power-picture-id1303002202?s=612x612"
    },
    {
      'name': "Yoga7",
      'imageURL':
          "https://media.istockphoto.com/photos/my-presence-is-my-power-picture-id1303002202?s=612x612"
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 70,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print(
                        "if this is for first time it is supposed to work the same way");
                    print(
                        "But if already account is set up this should go to home");
                    print(
                        "Unimplemented because local storage is not set up for the moment");
                    print(
                        "Same goes for the below button where adding 3 habits is mandatory for first time");
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                    size: 40,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Add Habits",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 70,
          child: Container(
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
        Align(
          alignment: Alignment.bottomCenter,
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
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MainFrame()));
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (_) => HabitsDescription(habitName: "")));
                  // TODO: Navigate to home page after atleast 3 selection
//                 },
//                 child: Text("Create My Own")),
            child: Text("Go to Home")),
          ),
        )
      ],
    ));
  }

  Widget gridTile(double height, double width, Map<String, String> habit) {
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
                habit["imageURL"]!,
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
