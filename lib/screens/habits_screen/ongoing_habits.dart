// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class OngoingHabits extends StatefulWidget {
  const OngoingHabits({Key? key}) : super(key: key);

  @override
  _OngoingHabitsState createState() => _OngoingHabitsState();
}

class _OngoingHabitsState extends State<OngoingHabits> {
  // TODO: this list of map should be from database
  List<Map<String, dynamic>> onGoingHabits = [
    {
      "name": "Meditate",
      "streak_days": 10,
      "friends": ['Name1', "name2", "name3", "name4", "name5", "name6"],
    },
    {
      "name": "Meditate",
      "streak_days": 21,
      "friends": ['Name1', "name2", "name3", "name4", "name5", "name6"],
    },
    {
      "name": "Meditate",
      "streak_days": 8,
      "friends": ['Name1', "name2", "name3", "name4", "name5", "name6"],
    },
    {
      "name": "Meditate",
      "streak_days": 29,
      "friends": ['Name1', "name2", "name3", "name4", "name5", "name6"],
    },
    {
      "name": "Meditate",
      "streak_days": 0,
      "friends": ['Name1', "name2", "name3", "name4", "name5", "name6"],
    }
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String url =
        "https://www.naturopathy.ie/wp-content/uploads/2014/07/leaping-banner.jpg";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Habits",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Positioned(
              child: SizedBox(
                height: height * .3,
                width: width,
                child: Image.asset(
                  "assets/onboarding/jump.jpg",
                  fit: BoxFit.fill,
                  // color: Colors.grey[50],
                ),
              ),
            ),
            Positioned(
              top: height * .25 - 50,
              child: Container(
                height: height * .75,
                width: width,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Text(
                      "A little a day will make a great fortune in the future",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: Container(
                          // height: height * .7,
                          // width: width,
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (var i = 0; i < 10; i++)
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.black,
                                              border: Border.all(
                                                  color: Colors.blue,
                                                  width: 2.0)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            child: Image.asset(
                                              "assets/onboarding/auth.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: onGoingHabits.length + 1,
                                    itemBuilder: (_, index) {
                                      if (index == onGoingHabits.length) {
                                        return Container(
                                          height: 100,
                                        );
                                      }
                                      return habitsRemainderCard(
                                          300, width, onGoingHabits[index]);
                                    }),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget habitsRemainderCard(
      double height, double width, Map<String, dynamic> habitDetails) {
    return Card(
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: width -
                          100, //TODO: here 100 need to be changes with limit of days width
                      child: Slider(
                        value: habitDetails['streak_days'] / 1.0,
                        min: 0,
                        max: 30,
                        onChanged: (newVal) {},
                      ),
                    ),
                    Text(habitDetails['streak_days'].toString() + " " + 'days'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      habitDetails['name'],
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      // color: Colors.black,
                      child: Stack(
                        children: [
                          for (var i = 0;
                              i < habitDetails['friends'].length;
                              i++)
                            Positioned(
                                left: ((150) - 40) /
                                    (habitDetails['friends'].length) *
                                    i, //   x*friends + childWidth = parent width
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      "assets/onboarding/auth.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ))
                        ],
                      ),
                    )
                  ],
                ),
                Text("To a calmer, peaceful mind!"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        print("Function to remind me about the habit");
                      }, //TODO
                      child: Container(
                        height: 30,
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Remind",
                            style: TextStyle(color: Colors.red),
                          ),
                        )),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.red)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print("Its done update the streak in database");
                        habitDetails['streak_days']++;
                        setState(() {});
                      }, //TODO
                      child: Container(
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Text("Done"),
                              Icon(
                                Icons.celebration,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



//TODO: IDEAS
// 1. it will be a 30 days habit so the slider shows ur streak.. when a friends streak is compete he is given a green sign in his profile image