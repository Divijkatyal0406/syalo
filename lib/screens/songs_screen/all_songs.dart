// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:syalo/screens/songs_screen/music_player.dart';
import 'package:syalo/screens/songs_screen/search_songs.dart';
import 'package:syalo/screens/songs_screen/songs_model.dart';

class AllSongs extends StatefulWidget {
  bool needBack;
  AllSongs({Key? key, this.needBack = false}) : super(key: key);

  @override
  _AllSongsState createState() => _AllSongsState();
}

class _AllSongsState extends State<AllSongs> {
  final Map<String, List<Song>> allSongs = SongsContainer().getAllSongs;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: widget.needBack,
          title: Text(
            "All Music",
            style: TextStyle(color: Colors.red, fontSize: 24),
          ),
          leading: widget.needBack
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back))
              : null,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SearchSongs()));
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ))
          ],
        ),
        body: ListView(
          children: [
            songCategoryWise("Trending", allSongs["Trending"]!),
            songCategoryWise("Nature", allSongs["Nature"]!),
            songCategoryWise("Calming", allSongs["Calming"]!),
            songCategoryWise("Meditation", allSongs["Meditation"]!),
            songCategoryWise("Focus", allSongs["Focus"]!),

            // SizedBox(
            //   height: height,
            //   width: width,
            //   // color: Colors.red,
            // ),
            // Row(
            //   children: [
            //     // IconButton(
            //     //     onPressed: () {
            //     //       Navigator.pop(context);
            //     //     },
            //     //     icon: Icon(Icons.arrow_back)),
            //     SizedBox(
            //         height: height * .10,
            //         width: width,
            //         // color: Colors.white,
            //         child: Padding(
            //             padding: EdgeInsets.symmetric(
            //                 horizontal: width * .125 - 8,
            //                 vertical: height * .025 - 8),
            //             child: GestureDetector(
            //               onTap: () {
            //                 print(
            //                     "We will shift to a page where the seach feature is implemented on all the songs");
            //               }, //TODO: implementt the debug log
            //               child: Card(
            //                 shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(20)),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Expanded(
            //                         child: Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: TextFormField(
            //                         controller: _searchController,
            //                         onEditingComplete: () =>
            //                             FocusScope.of(context).unfocus(),
            //                         decoration: InputDecoration(
            //                             border: InputBorder.none,
            //                             prefixIcon: Icon(Icons.search),
            //                             hintText: "What are you looking for?"),
            //                         style: TextStyle(
            //                             fontSize: 15,
            //                             fontWeight: FontWeight.w400),
            //                       ),
            //                     )),
            //                     //TODO: implemnt search feature
            //                     // )
            //                   ],
            //                 ),
            //               ),
            //             ))),
            //   ],
            // ),
            // Positioned(
            //   top: height * .10,
            //   child: SizedBox(
            //     height: height * .90,
            //     width: width,
            //     child:
            //   ),
            // ),
          ],
        ),
      ),
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
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                letterSpacing: 2.0,
              ),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => MusicPlayer(
                  tag: categoryName + index.toString(),
                  songURL: songDetail.url,
                  imageURL: songDetail.image,
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
                    child: Image.asset(
                      songDetail.image,
                      fit: BoxFit.fill,
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
