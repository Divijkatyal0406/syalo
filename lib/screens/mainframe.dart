import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:syalo/habbits/habbitHome.dart';
import 'package:syalo/screens/consultant_screen.dart';
import 'package:syalo/screens/habits_screen/ongoing_habits.dart';
import 'package:syalo/screens/home_screen.dart';
import 'package:syalo/screens/onboarding_screens/select_habits.dart';
import 'package:syalo/screens/profile_screen.dart';
import 'package:syalo/screens/songs_screen/all_songs.dart';
import 'package:syalo/screens/support_group_screen.dart';
import 'package:syalo/songTracks/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  _MainFrameState createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {
  int _selectedIndex = 0;

  static List<Widget> _screens = [
    HomeScreen(),
    ConsultantScreen(),
    //Add learning path widget here @mayank

    AllSongs(),
    HabbitScreen(),
    // SupportGroupScreen(),
    // HomePage(),
    // SupportGroupScreen(),
    // OngoingHabits(),

    // ProfileScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: _screens[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        child: SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.floating,
          // snakeShape: SnakeShape.circle,
          elevation: 5.0,
          // shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(.0)),
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),

          ///configuration for SnakeNavigationBar.color
          snakeViewColor: Colors.grey,
          // selectedItemColor: snakeShape == SnakeShape.indicator ? selectedColor : null,
          unselectedItemColor: Color(0xFF131016),

          showUnselectedLabels: false,
          showSelectedLabels: false,

          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/bottom1.png'),size: 45,),
                label: 'tickets'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/bottom2.png'),size: 45,),
                label: 'calendar'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/bottom3.png'),size: 45,),
                label: 'home'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/sounds.png'),size: 45,),
                label: 'microphone'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/bottom5.png'),size: 45,),
                label: 'search')
          ],
        ),
      ),
    );
  }
}
