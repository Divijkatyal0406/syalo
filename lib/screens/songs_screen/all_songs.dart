// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syalo/screens/songs_screen/music_player.dart';
import 'package:syalo/screens/songs_screen/songs_model.dart';

class AllSongs extends StatefulWidget {
  const AllSongs({Key? key}) : super(key: key);

  @override
  _AllSongsState createState() => _AllSongsState();
}

class _AllSongsState extends State<AllSongs> {
  var mostPopularSOngs = SongsContainer().mostPopular;
  TextEditingController _searchController = TextEditingController();

  List<String> randomYogaImages = [
    "https://images.pexels.com/photos/372281/pexels-photo-372281.jpeg",
    "https://cdn.pixabay.com/photo/2018/02/06/14/07/ease-3134828_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/03/26/21/54/yoga-2176668_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/05/10/21/50/meditation-1384758_960_720.jpg",
  ];

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
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _searchController,
                              onEditingComplete: () =>
                                  FocusScope.of(context).unfocus(),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.search),
                                  hintText: "What are you looking for?"),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          )), //TODO: implemnt search feature
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
                  songCategoryWise("Trending", mostPopularSOngs),
                  songCategoryWise("Favorites", mostPopularSOngs),
                  songCategoryWise("Calm", mostPopularSOngs),
                  songCategoryWise("Hard Rock", mostPopularSOngs),
                  songCategoryWise("Instrumental", mostPopularSOngs),
                  songCategoryWise("Nature", mostPopularSOngs),
                  Padding(padding: EdgeInsets.only(bottom: 200)),
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
                for (var i = 0; i < songDetails.length; i++)
                  songCardWidget(categoryName, songDetails[i], i),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding songCardWidget(String categoryName, Song songDetail, int index) {
    String imageSelected = randomYogaImages[Random().nextInt(4)];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => MusicPlayer(
                  tag: categoryName + index.toString(),
                  songURL: songDetail.url,
                  imageURL: imageSelected,
                ))), //TODO: image url should be provided not assets
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Hero(
            tag: categoryName + index.toString(),
            child: Container(
              height: categoryName == "Trending" ? 265 : 165,
              width: 170,
              color: Color.fromARGB(255, 180, 179, 179),
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: Image.network(
                      imageSelected,
                      //TODO: use songdetail.image
                      fit: BoxFit.fill,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (_, __, ___) =>
                          Image.asset("assets/onboarding/auth.png"),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            songDetail.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            songDetail.singer,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
