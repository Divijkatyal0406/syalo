// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    this.searchWord = 'Search',
  }) : super(key: key);

  final String searchWord;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: searchWord,
            suffixIcon: Icon(Icons.search),
            hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            contentPadding: EdgeInsets.only(left: 32, top: 10, bottom: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1000),
              borderSide: BorderSide(),
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 15,
              offset: const Offset(0, 3),
            ),
          ],
        ),
      ),
    );
  }
}
