import 'package:flutter/material.dart';

class HabitContainer2 extends StatefulWidget {
  const HabitContainer2({ Key? key, required this.image_url,required this.name, required this.habitsCompleted, required this.score }) : super(key: key);
  final String image_url,name,habitsCompleted,score;
  @override
  State<HabitContainer2> createState() => _HabitContainer2State();
}

class _HabitContainer2State extends State<HabitContainer2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: 428,
      height: 73,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Color.fromRGBO(244, 244, 244, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    //color: Color.fromRGBO(0, 0, 0, 1),
                    borderRadius: BorderRadius.all(Radius.elliptical(45, 45)),
                  ),
                  child: Image.network(widget.image_url),
                ),
              SizedBox(width: 10),
              Text(
                widget.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),

                    fontSize: 22,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ],
          ),
          Text(
            widget.habitsCompleted,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),

                fontSize: 22,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
          Text(
            widget.score,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),

                fontSize: 22,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )
        ],
      ),
    );
  }
}
