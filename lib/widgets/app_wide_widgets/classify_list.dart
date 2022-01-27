import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClassifyList extends StatelessWidget {
  final String title;
  ClassifyList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
              ),

            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 165,
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 14.0),
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  child: GridTile(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            "https://greenglobaltravel.com/wp-content/uploads/2018/04/"
                            "Gondwana-Rainforest-Biggest-Forest-feature-update.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                    footer: ClipRRect(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: GridTileBar(
                            title: Text("Beach",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),softWrap: true,),
                          ),
                      ),
                    ),
                      ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}