// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:suprself/sound_screen/music_player.dart';
import 'package:suprself/sound_screen/songs_model.dart';

class AllSongs extends StatefulWidget {
  const AllSongs({Key? key}) : super(key: key);

  @override
  _AllSongsState createState() => _AllSongsState();
}

class _AllSongsState extends State<AllSongs> {
  var mostPopularSOngs = SongsContainer().mostPopular;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
            // color: Colors.red,
          ),
          SizedBox(
              height: height * .10,
              width: width,
              // color: Colors.white,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * .125 - 8,
                      vertical: height * .025 - 8),
                  child: GestureDetector(
                    onTap: () {
                      print(
                          "We will shift to a page where the seach feature is implemented on all the songs");
                    }, //TODO: implementt the debug log
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search),
                          Text(
                            "What are you lookin for",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ) //TODO: implemnt search feature
                          // )
                        ],
                      ),
                    ),
                  ))),
          Positioned(
            top: height * .10,
            child: SizedBox(
              height: height * .90,
              width: width,
              child: ListView(
                //TODO: this is hardcoded need to add more data in the songs model and category name
                children: [
                  songCategoryWise("Favorites", mostPopularSOngs),
                  songCategoryWise("Favorites", mostPopularSOngs),
                  songCategoryWise("Favorites", mostPopularSOngs),
                  songCategoryWise("Favorites", mostPopularSOngs),
                  songCategoryWise("Favorites", mostPopularSOngs),
                  songCategoryWise("Favorites", mostPopularSOngs),
                  songCategoryWise("Favorites", mostPopularSOngs),
                  songCategoryWise("Favorites", mostPopularSOngs),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget songCategoryWise(String categoryName, List<Song> songDetails) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              categoryName,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var songDetail in songDetails)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => MusicPlayer(
                                songURL: songDetail.url,
                                imageURL:
                                    "https://images.pexels.com/photos/372281/pexels-photo-372281.jpeg",
                              ))), //TODO: image url should be provided not assets
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: 165,
                          width: 170,
                          child: Stack(
                            children: [
                              SizedBox.expand(
                                child: Image.network(
                                  "https://images.pexels.com/photos/372281/pexels-photo-372281.jpeg",
                                  //TODO: use songdetail.image
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Text(
                                    songDetail.name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
