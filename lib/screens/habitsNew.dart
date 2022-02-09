import 'package:date_time_picker/date_time_picker.dart';
import 'package:day_picker/day_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_format/date_format.dart';

class CreateHabbit extends StatelessWidget {

  List<String> days=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Create Habbit",
          style: GoogleFonts.rowdies(
              fontStyle: FontStyle.normal, color: Colors.black, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Expanded(child: Text("Hello")),
            // Expanded(child: Text("bello"))
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(top: 10),
              height: 80,
              child: Row(
                children: [
                  Container(padding: EdgeInsets.all(5), child: Text("Name")),
                  Expanded(
                    // width: 200,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
                            borderSide: BorderSide(
                              color: Colors.black45,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.black54,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Container(
              padding: EdgeInsets.all(5),
              height: 100,
              child: Row(
                children: [
                  Container(padding: EdgeInsets.all(5), child: Text("Days")),
                  Expanded(
                    // width: 340,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: SelectWeekDays(
                          unSelectedDayTextColor: Colors.black,
                          border: false,
                          boxDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.black12,
                            // gradient: LinearGradient(
                            //   begin: Alignment.topLeft,
                            //   colors: [const Color(0xFFE55CE4), const Color(0xFFBB75FB)],
                            //   tileMode:
                            //   TileMode.repeated, // repeats the gradient over the canvas
                            // ),
                          ),
                          onSelect: (values) {
                            for(var i=0;i<values.length;i++) {
                              days.add(values[i]);
                            }
                            // <== Callback to handle the selected days
                            print(values);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      "Remind Me At",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: DateTimePicker(
                        type: DateTimePickerType.dateTimeSeparate,
                        dateMask: 'd MMM, yyyy',
                        initialValue: DateTime.now().toString(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: Icon(Icons.event),
                        dateLabelText: 'Date',
                        timeLabelText: "Time",
                        onChanged: (val) => print(val),
                          validator: (val) {
                          print(val);
                          return null;
                          },
                        onSaved: (val) => print(val),
                    ),
                  ),
                Divider(
                  color: Colors.black,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(top: 10),
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(padding: EdgeInsets.all(5), child: Text("Score",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
                      Container(
                        width: 110,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade300,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
                                borderSide: BorderSide(
                                  color: Colors.black45,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.black54,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(top: 10),
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(padding: EdgeInsets.all(5), child: Text("Add Friend",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        child: IconButton(icon:const Icon(Icons.add),iconSize: 55,onPressed: () {},),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
