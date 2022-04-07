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
  var mostPopularSOngs = SongsContainer().mostPopular;
  TextEditingController _searchController = TextEditingController();

  List<String> songsImage = [
    "https://s18670.pcdn.co/wp-content/uploads/WAT-Relaxing-Music.png",
    "https://m.media-amazon.com/images/I/91CpAVMdz2L._SS500_.jpg",
    "https://i.pinimg.com/originals/13/f7/f3/13f7f3512ab2804636c28c14e9f3daac.jpg",
    "https://img.apmcdn.org/9ef69ededb1f2792f45e52294af605d4b4aaecc4/widescreen/786473-20200402-trees-in-vermont-at-sunset.jpg",
    "https://i.scdn.co/image/ab67616d0000b2738876ae72bcec463ef10916ef",
    "https://wallpaperaccess.com/full/7307632.jpg",
    "https://i1.sndcdn.com/artworks-B5DCzAZwe4DTSnqu-ZmElDA-t500x500.jpg",
    "https://i.pinimg.com/originals/cd/0e/3c/cd0e3c6522beab0f62b5a7cf363e216c.jpg",
    "https://st.depositphotos.com/2284893/2439/i/450/depositphotos_24390641-stock-photo-monk-in-meditation-at-sunrise.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
            songCategoryWise("Trending", mostPopularSOngs),
            songCategoryWise("Favorites", mostPopularSOngs),
            songCategoryWise("Calm", mostPopularSOngs),
            songCategoryWise("Hard Rock", mostPopularSOngs),
            songCategoryWise("Instrumental", mostPopularSOngs),
            songCategoryWise("Nature", mostPopularSOngs),

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => MusicPlayer(
                  tag: categoryName + index.toString(),
                  songURL: songDetail.url,
                  imageURL: songsImage[index],
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
                      songsImage[index],
                      //TODO: use songdetail.image
                      fit: BoxFit.fill,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                              // value: loadingProgress.expectedTotalBytes != null
                              //     ? loadingProgress.cumulativeBytesLoaded /
                              //         loadingProgress.expectedTotalBytes!
                              //     : null,
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
