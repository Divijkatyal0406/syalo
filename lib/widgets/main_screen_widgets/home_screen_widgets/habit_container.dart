import 'package:flutter/material.dart';

class HabitContainer extends StatelessWidget {
  const HabitContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 100,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        elevation: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              "Habits Today",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            Text(
              "2/7",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
