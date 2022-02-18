import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClassifyList extends StatelessWidget {
  final String title;

  ClassifyList({Key? key, required this.title}) : super(key: key);

  final heading = ["Forest", "Beach", "Rain"];
  final imgUrls = [
    "https://images.unsplash.com/photo-1511497584788-876760111969?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&w=1000&q=80",
    "https://i.pinimg.com/originals/10/0b/b5/100bb5b73b8bb96d199ff550ab9ed2de.jpg",
    "https://images.unsplash.com/photo-1515694346937-94d85e41e6f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFpbnxlbnwwfHwwfHw%3D&w=1000&q=80"
  ];
  var idx = 0;

  final heading1 = [
    "Moving on from Breakup",
    "Why and How to set a Routine",
    "Cheating in relationship"
  ];
  final imgUrls1 = [
    "https://i.pinimg.com/originals/63/87/b1/6387b17d868499ee6484525e6ddad222.png",
    "https://www.soundsofchanges.eu/wp-content/uploads/2015/08/VS-47.jpg",
    "https://cdn.dnaindia.com/sites/default/files/styles/full/public/2018/02/04/648034-relationship-social-media-thinkstock-072417.jpg"
  ];
  var idx1 = 0;

  @override
  Widget build(BuildContext context) {
    return title == "Discover Paths"
        ? Container(
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
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                width: 165,
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 14.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0)),
                child: GridTile(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      imgUrls1[idx1],
                      fit: BoxFit.cover,
                    ),
                  ),
                  footer: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Expanded(
                        child: Column(
                          children: [
                            Text(
                              heading1[idx1++],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                              // softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    )
        : Container(
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
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                width: 165,
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 14.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0)),
                child: GridTile(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      imgUrls[idx],
                      fit: BoxFit.cover,
                    ),
                  ),
                  footer: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: GridTileBar(
                        title: Text(
                          heading[idx++],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                          softWrap: true,
                        ),
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
