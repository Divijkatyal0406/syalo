import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:syalo/screens/consultant_screen.dart';
import 'package:syalo/screens/home_screen.dart';
import 'package:syalo/screens/profile_screen.dart';
import 'package:syalo/screens/support_group_screen.dart';

class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  _MainFrameState createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {

  int _selectedIndex = 2;

  static const List<Widget> _screens = [
    HomeScreen(),
    SupportGroupScreen(),
    HomeScreen(),
    ConsultantScreen(),
    ProfileScreen(),
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
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
        child: SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: SnakeShape.circle,
          elevation: 5.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),

          ///configuration for SnakeNavigationBar.color
          snakeViewColor: Colors.black,
          // selectedItemColor: snakeShape == SnakeShape.indicator ? selectedColor : null,
          unselectedItemColor: Color(0xFF131016),


          showUnselectedLabels: false,
          showSelectedLabels: false,

          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'tickets'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'calendar'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'microphone'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'search')
          ],
        ),
      ),
    );
  }
}
