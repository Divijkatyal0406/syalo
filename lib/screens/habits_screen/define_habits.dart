// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:syalo/screens/habits_screen/habit_storage_mangement.dart';
import 'package:syalo/screens/habits_screen/models/define_habit_models.dart';

class HabitsDescription extends StatefulWidget {
  String habitName;
  HabitsDescription({Key? key, required this.habitName}) : super(key: key);

  @override
  _HabitsDescriptionState createState() => _HabitsDescriptionState();
}

class _HabitsDescriptionState extends State<HabitsDescription> {
  late TextEditingController _nameController;
  late TextEditingController _perdayController;
  late TextEditingController _reasonController;

  bool repeatEveryday = true;
  List<String> reminders = [];
  int timesPerday = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController(text: widget.habitName);
    _reasonController = TextEditingController();
    _perdayController = TextEditingController();
  }

  List<String> days = [
    'Sunday',
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  List<bool> selectedDays = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  String selected_days() {
    String result = "";
    for (int i = 0; i < selectedDays.length; i++) {
      if (selectedDays[i]) {
        result += i.toString();
      }
    }
    return result;
  }

  final _box = Hive.box<Map<dynamic, dynamic>>("User");

  int maxLines = 1;
  String timeSelected = "12:00";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Text(
            "Add Habit",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        floatingActionButton: ElevatedButton(
            onPressed: () async {
              print("Save all the data in the database");

              String repeatDays = "";
              String image =
                  "https://www.ecommunity.com/sites/default/files/styles/blog_post_desktop/public/blog-posts/2019-03/sugar-intake-blog.jpg?itok=-C8Hidtj";

              if (repeatEveryday) {
                for (int i = 0; i < 7; i++) {
                  repeatDays += i.toString();
                  repeatDays += ',';
                }
              } else {
                for (int i = 0; i < selectedDays.length; i++) {
                  if (selectedDays[i]) {
                    repeatDays += i.toString();
                    repeatDays += ',';
                  }
                }
              }

              Habit newHabit = Habit(
                userId: await _box.get(0)!['id'],
                name: _nameController.text,
                repeatDays: repeatDays,
                image: image,
                timesPerDay: timesPerday,
                reminder: reminders.join(','),
                reason: _reasonController.text,
                streak: 0,
              );
              var response = await HabitService().addHabits(habit: newHabit);
              if (response.toString() == "Success") {
                // print(response.toString());

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 1),
                    content: Text(
                      "Added Successfully",
                    ),
                  ),
                );
              } else {
                // print(response.toString());
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 1),
                    content: Text(
                      "Failed to Add",
                    ),
                  ),
                );
              }
            },
            child: Text("Save. Let's Win!")),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
            child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.edit),
              title: TextFormField(
                readOnly: widget.habitName != "",
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Name",
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(Icons.repeat),
              title: Text("Repeat Everyday"),
              trailing: Checkbox(
                value: repeatEveryday,
                onChanged: (bool? newState) {
                  setState(
                    () {
                      repeatEveryday = newState!;
                    },
                  );
                },
              ),
            ),
            if (!repeatEveryday)
              for (int i = 0; i <= 6; i++)
                ListTile(
                  title: Text(days[i]),
                  trailing: Checkbox(
                      value: selectedDays[i],
                      onChanged: (bool? newVal) {
                        setState(() {
                          selectedDays[i] = newVal!;
                        });
                      }),
                ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(
                Icons.location_searching,
              ),
              title: Text("Times per day"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        timesPerday += timesPerday < 5 ? 1 : 0;
                      });
                    },
                    icon: Icon(Icons.arrow_upward_sharp),
                  ),
                  Text(
                    timesPerday.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          timesPerday -= timesPerday > 1 ? 1 : 0;
                        });
                      },
                      icon: Icon(Icons.arrow_downward_sharp))
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text("Remind me at"),
              subtitle: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var remainder in reminders)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          remainder,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                reminders.remove(remainder);
                              });
                            },
                            icon: Icon(Icons.cancel_rounded)),
                      ],
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Add Remainder",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            if (reminders.length < timesPerday) {
                              timeConversion(context);
                            } else {}
                          },
                          icon: Icon(Icons.add))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(Icons.data_array),
              title: TextFormField(
                controller: _reasonController,
                // maxLines: 2,
                decoration: InputDecoration(
                  hintText: "Whats Your Why?",
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("Add Partners"),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.share)),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        )));
  }

  Future<void> timeConversion(BuildContext context) async {
    TimeOfDay? time = await showTimePicker(
        // onEntryModeChanged: (),
        context: context,
        initialTime: TimeOfDay.now());

    if (time != null) {
      setState(() {
        String hour = time.hour.toString();
        String min = time.minute.toString();
        if (time.hour < 10) {
          hour = "0" + time.hour.toString();
        }
        if (time.minute < 10) {
          min = "0" + time.minute.toString();
        }

        timeSelected = hour + ":" + min;
        reminders.add(timeSelected);
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _reasonController.dispose();
    _perdayController.dispose();
  }
}
