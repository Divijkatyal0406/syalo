// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syalo/model/app_header2.dart';

class Sounds extends StatelessWidget {
  const Sounds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 25),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 120),
                Image(image: AssetImage('assets/images/meditation.png')),
                SizedBox(height: 40),
                Text(
                  'Meditation',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 60),
                Text(
                  '7626 are meditating with you.....',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 45),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xff0081FF),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: Image(
                          image: AssetImage(
                            'assets/images/triangle.png',
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
