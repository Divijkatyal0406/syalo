// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syalo/database/db.dart';
import 'package:syalo/model/blue_button.dart';
import 'package:syalo/model/random_box.dart';

class NewHabit extends StatelessWidget {
  const NewHabit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios_sharp)),
                      SizedBox(width: 10),
                      Text(
                        'New Habit',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 10),
                        RandomBox(height: 60, text: ''),
                        SizedBox(height: 50),
                        Text(
                          'Time',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.12),
                          child: RandomBox(height: 60, text: ''),
                        ),
                        SizedBox(height: 60),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Link to Learn Path',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                              ),
                            ),
                            InkWell(
                                onTap: () {}, child: Icon(Icons.add, size: 40)),
                          ],
                        ),
                        SizedBox(height: 60),
                        Center(
                          child: Text(
                            'Add Habit Partner',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Assign Points',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                              ),
                            ),
                            Container(
                              width: 48,
                              height: 34,
                              decoration: BoxDecoration(
                                color: Color(0xffc4c4c4),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 31),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () async {
                                //Provide text controllers for habit name
                                var count = await FireStoreDB().getHabitsList();
                                FireStoreDB().addHabit("Random Happy Faces",count.length+1);
                              },
                              child: BlueButton(text: 'Done'),
                            ),
                          ],
                        ),
                      ],
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
