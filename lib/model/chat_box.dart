// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  const ChatBox({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 173,
      height: 60,
      decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 15,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(1000)),
    );
  }
}
