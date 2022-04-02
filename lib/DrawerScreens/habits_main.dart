// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syalo/OtherScreens/habits_friends.dart';
import 'package:syalo/OtherScreens/habits_habits.dart';
import 'package:syalo/OtherScreens/new_habit.dart';

class HabitsMain extends StatefulWidget {
  const HabitsMain({Key? key}) : super(key: key);

  @override
  _HabitsMainState createState() => _HabitsMainState();
}

class _HabitsMainState extends State<HabitsMain> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height * 1.7,
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 90),
                        Text(
                          '7 Days (win emoji)',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 20,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Today',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 25,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '16',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(46, 75, 226, 1),
                                  fontSize: 25,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            Text(
                              '17',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(46, 75, 226, 1),
                                  fontSize: 25,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            Container(
                              width: 55,
                              height: 66,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                color: Color.fromRGBO(241, 241, 255, 1),
                              ),
                              child: Center(
                                child: Text(
                                  '18',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(46, 75, 226, 1),
                                      fontSize: 25,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                              ),
                            ),
                            Text(
                              '19',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(46, 75, 226, 1),
                                  fontSize: 25,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            Text(
                              '20',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(46, 75, 226, 1),
                                  fontSize: 25,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 328,
                          height: 192,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(43, 43, 43, 1),
                                  offset: Offset(10, 10),
                                  blurRadius: 20)
                            ],
                            color: Color.fromRGBO(1, 1, 1, 1),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Text(
                                      'Daily Mood',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          fontSize: 25,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 50),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50),
                        Container(
                          width: 414,
                          height: 40,
                          child: TabBar(
                            isScrollable: false,
                            labelColor: Colors.black,
                            indicatorColor: Colors.black,
                            tabs: const [
                              Tab(
                                  child: Text(
                                'Friends',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 25,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                              Tab(
                                  child: Text(
                                'Habits',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 25,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Expanded(
                          child: TabBarView(
                            children: [
                              SingleChildScrollView(
                                child: HabitsFriends(),
                              ),
                              SingleChildScrollView(
                                child: Habitshabits(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      padding: EdgeInsets.only(right: 40),
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                  size: 37,
                                ),
                              ),
                              SizedBox(width: 30),
                              Text(
                                'Habits',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 37,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.bold,
                                    height: 1),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewHabit(),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 37,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
