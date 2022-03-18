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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController(text: widget.habitName);
    _perdayController = TextEditingController();
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
            },
            child: Text("Save. Let's Win!")),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _nameController,
                  readOnly: _nameController.text != "",
                  decoration: InputDecoration(
                      focusColor: Colors.red,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(5)),
                      prefixIcon: Icon(Icons.edit),
                      hintText: "Name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: TextEditingController(text: "Repeat Everyday"),
                  readOnly: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(5)),
                      prefixIcon: Icon(Icons.repeat)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _perdayController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      // enabledBorder: InputBorder.none,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(5)),
                      prefixIcon: Icon(Icons.location_searching),
                      hintText: "Times Per day"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.notifications),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Remind me At")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(timeSelected),
                              IconButton(
                                  onPressed: () async {
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
                                      });
                                    }
                                  },
                                  icon: Icon(Icons.timer))
                            ]),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _reasonController,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                      hintText: "Whats your Why?",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(5)),
                      prefixIcon: Icon(Icons.query_stats_sharp)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.people),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Add Partners")
                          ],
                        ),
                        Icon(Icons.share)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
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
