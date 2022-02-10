// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MikeIcon extends StatelessWidget {
  const MikeIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xff00C208),
        borderRadius: BorderRadius.circular(1000),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Icon(
        Icons.mic_none_rounded,
        size: 36,
        color: Colors.white,
      ),
    );
  }
}
