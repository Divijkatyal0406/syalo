import 'package:flutter/material.dart';
import 'package:syalo/model/habit_container.dart';
import 'package:syalo/model/habit_container2.dart';

class HabitsFriends extends StatelessWidget {
  const HabitsFriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 20,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  Text(
                    'Today',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 20,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  Text(
                    'Score',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 20,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ],
              ),
            ),
            Divider(color: Color.fromRGBO(0, 0, 0, 1), thickness: 1),
            SizedBox(height: 10),
            HabitContainer2(),
            HabitContainer2(),
            HabitContainer2(),
            HabitContainer2(),
            HabitContainer2(),
            HabitContainer2(),
            HabitContainer2(),
            HabitContainer2(),
            HabitContainer2(),
            HabitContainer2(),
            HabitContainer2(),
          ],
        ),
      ),
    );
  }
}
