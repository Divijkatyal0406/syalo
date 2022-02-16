import 'package:flutter/material.dart';
import 'package:syalo/DrawerScreens/chat_page.dart';
import 'package:syalo/DrawerScreens/favourites.dart';
import 'package:syalo/DrawerScreens/habits_main.dart';
import 'package:syalo/DrawerScreens/journal_main.dart';
import 'package:syalo/OtherScreens/search_results.dart';
import 'package:syalo/model/drawer_button.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Container(
              width: 500,
              margin: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,Shreyas',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 28,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  Text(
                    'Conquer the day!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 16,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  )
                ],
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {

                    },
                    child: DrawerButton(
                        text: 'Appointment',
                        icon: Icons.calendar_today_outlined),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HabitsMain(),
                        ),
                      );
                    },
                    child: DrawerButton(
                        text: 'Habits & Logs', icon: Icons.timelapse_sharp),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JournalMain(),
                          ),
                        );
                      },
                      child: DrawerButton(
                          text: 'Journal', icon: Icons.book_sharp)),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Favourite(),
                          ),
                        );
                      },
                      child: DrawerButton(
                          text: 'Favourites', icon: Icons.favorite)),
                  InkWell(
                      onTap: () {
                      },
                      child:
                          DrawerButton(text: 'Settings', icon: Icons.settings)),
                  DrawerButton(
                      text: 'Payment & Cash', icon: Icons.monetization_on),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
