import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HabitsSelection extends StatelessWidget {

  var habits=["Workout","Meditate","Read","Yoga","Stretch","Walk","Learn","Good Sleep"];
  var imgs=["workout.jpg","meditation.jpg","read.jpg","yoga.jpeg","stretch.jpg","walk.jpg","learn.jpg","goodsleep.jpg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black), onPressed: () {  },
        ),
        backgroundColor: Colors.white,
        title: Text("Let's Add 3 habits",style: GoogleFonts.rowdies(fontStyle: FontStyle.normal,color: Colors.black,fontSize: 25),),
      ),
      body:Row(
        children: [
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.count(
                crossAxisCount: 2,
                children: new List<Widget>.generate(8, (index) {
                  return new GridTile(
                      // child: new Card(
                      //     color: Colors.blue.shade200,
                      //     child: new Center(
                      //       child: new Text('tile $index'),
                      //     )
                      // ),
                      child: new Card(
                        child: Container(
                          // margin: EdgeInsets.all(3),
                          // padding: EdgeInsets.all(10),
                          height: 7,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/${imgs[index]}'))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('${habits[index]}',style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                        ),
                        margin: EdgeInsets.only(left: 13.0, right: 13.0, top: 13.0),
                      ),
                    );
                }),
              ),
          ),
        ],
      ),
    );
  }
}
