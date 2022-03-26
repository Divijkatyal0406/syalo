// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayer extends StatefulWidget {
  String songURL, imageURL;
  MusicPlayer({required this.songURL, required this.imageURL});

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final AudioPlayer _player = AudioPlayer();
  String err = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try {
      _player.setUrl(widget.songURL);
      _player.play();
      _player.setLoopMode(LoopMode.all);
    } catch (e) {
      err = "ERROR";
    }
  }

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
              child: Image.network(
                widget.imageURL,
                fit: BoxFit.fill,
                errorBuilder: (_, __, ___) => Image.asset(
                    "assets/onboarding/auth.png"), //TODO: add default image
              ),
            ),
            Opacity(
              opacity: 0.7,
              child: Container(
                // height: height * .10,
                // width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: const [
                        Colors.white,
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.4, 1]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: Icon(Icons.arrow_back)),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              IconButton(
                                onPressed: () {
                                  print("SHARE");
                                },
                                icon: Icon(Icons.share),
                              ), //TODO: IMPLEMENT SHARE FEATURE
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  onPressed: () {
                                    print("UPDATE IN DATABASE");
                                  },
                                  icon: Icon(Icons
                                      .thumb_up_sharp)), //TODO: UPDATE THE DATABASE
                            ],
                          )
                        ],
                      ),
                      Text(
                        "Song Name",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
                child: err.isEmpty
                    ? StreamBuilder<PlayerState>(
                        stream: _player.playerStateStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var playerState = snapshot.data;
                            var processingState = playerState!.processingState;
                            bool playing = playerState.playing;

                            if (processingState == ProcessingState.loading ||
                                processingState == ProcessingState.buffering) {
                              return Container(
                                margin: EdgeInsets.all(8.0),
                                width: 64.0,
                                height: 64.0,
                                child: CircularProgressIndicator(),
                              );
                            } else if (playing != true) {
                              return IconButton(
                                icon: Icon(Icons.play_arrow),
                                iconSize: 64.0,
                                onPressed: _player.play,
                              );
                            } else if (processingState !=
                                ProcessingState.completed) {
                              return IconButton(
                                icon: Icon(Icons.pause),
                                iconSize: 64.0,
                                onPressed: _player.pause,
                              );
                            } else {
                              return IconButton(
                                icon: Icon(Icons.replay),
                                iconSize: 64.0,
                                onPressed: () => _player.seek(Duration.zero),
                              );
                            }
                          }
                          return CircularProgressIndicator();
                        })
                    : Text("Something went wrong.. TRY AGAIN"))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }
}
