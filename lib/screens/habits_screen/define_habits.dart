// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

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

  bool repeatEveryday = false;
  List remainders = [];
  int timesPerday = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController(text: widget.habitName);
    _reasonController = TextEditingController();
  }

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
            onPressed: () {
              print("Save all the data in the database");
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text("Succesfully saved")));
            },
            child: Text("Save. Let's Win!")),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
            child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.edit),
              title: TextFormField(
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
                  for (var remainder in remainders)
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
                                remainders.remove(remainder);
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
                            timeConversion(context);
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
        remainders.add(timeSelected);
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
