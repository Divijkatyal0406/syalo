import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
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
    SupportGroupScreen(),
    // HomePage(),
    // ConsultantScreen(),
    // SupportGroupScreen(),
    OngoingHabits(),
    AllSongs(),

    ProfileScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _screens[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        child: SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: SnakeShape.circle,
          elevation: 5.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),

          ///configuration for SnakeNavigationBar.color
          snakeViewColor: Colors.black,
          // selectedItemColor: snakeShape == SnakeShape.indicator ? selectedColor : null,
          unselectedItemColor: Color(0xFF131016),

          showUnselectedLabels: false,
          showSelectedLabels: false,

          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/bottom2.png')),
                label: 'tickets'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/bottom1.png')),
                label: 'calendar'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/bottom3.png')),
                label: 'home'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/bottom4.png')),
                label: 'microphone'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/bottom5.png')),
                label: 'search')
          ],
        ),
      ),
    );
  }
}
