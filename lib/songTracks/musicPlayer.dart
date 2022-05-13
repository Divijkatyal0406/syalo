import 'dart:ui';
// import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'database.dart';

class MusicPlayer extends StatefulWidget {
  Song song;

  MusicPlayer(this.song);

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

double currentSlider = 0;

class _MusicPlayerState extends State<MusicPlayer>
    with TickerProviderStateMixin {
  // AnimationController iconController;
  // bool isAnimated = false;
  // bool showPlay = true;
  // bool showPause = false;
  // AssetsAudioPlayer player = AssetsAudioPlayer();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   iconController=AnimationController(duration: Duration(seconds: 1), vsync:this);
  //   player.open(Audio('assets/sample_sound.mp3'),
  //       autoStart: false, showNotification: true);
  // }

  AudioPlayer audioPlayer = AudioPlayer();
  // AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  bool audioPlayerState = false;
  late AudioCache audioCache;

  // String path = song.url;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        audioPlayerState = event as bool;
        // audioPlayerState = event as AudioPlayerState;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    // audioCache.clearCache();
  }

  playMusic(String url) async {
    setState(() {
      audioPlayerState = true;
      // audioPlayerState = AudioPlayerState.PLAYING;
    });
    // await audioCache.load(url).whenComplete(() => audioCache.play(url));
    await audioPlayer.setUrl(url).whenComplete(() => audioPlayer.play(url));
  }

  pauseMusic() async {
    setState(() {
      // audioPlayerState = AudioPlayerState.PAUSED;
      audioPlayerState = false;
    });
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: "image",
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.song.image), fit: BoxFit.cover)),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, ${FirebaseAuth.instance.currentUser!.displayName!.split(' ')[0]}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8, left: 15),
                child: Icon(Icons.notifications_active_outlined, size: 30),
              )
            ],
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 50, left: 20, right: 20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 14,
                  spreadRadius: 16,
                  color: Colors.black.withOpacity(0.2),
                )
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                    height: 280,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            width: 1.5, color: Colors.white.withOpacity(0.2))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.song.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Icon(
                                Icons.favorite,
                                color: Colors.pink,
                                size: 40,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            widget.song.singer,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width,
                        //   child: SliderTheme(
                        //     data: SliderTheme.of(context).copyWith(
                        //         thumbShape: RoundSliderThumbShape(
                        //             enabledThumbRadius: 2),
                        //         trackShape: RectangularSliderTrackShape(),
                        //         trackHeight: 6),
                        //     child: Slider(
                        //       value: currentSlider,
                        //       max: widget.song.duration.toDouble(),
                        //       min: 0,
                        //       inactiveColor: Colors.white70,
                        //       activeColor: Colors.red,
                        //       onChanged: (val) {
                        //         currentSlider = val;
                        //         setState(() {});
                        //       },
                        //     ),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 20),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text(
                        //         Duration(seconds: currentSlider.toInt())
                        //             .toString()
                        //             .split('.')[0]
                        //             .substring(2),
                        //         style: TextStyle(color: Colors.white),
                        //       ),
                        //       Text(
                        //         Duration(seconds: widget.song.duration.toInt())
                        //             .toString()
                        //             .split('.')[0]
                        //             .substring(2),
                        //         style: TextStyle(color: Colors.white),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.settings_backup_restore_sharp,
                                size: 40,
                              ),
                              onPressed: () {
                                audioPlayer.seek(const Duration(seconds: -10));
                              },
                            ),
                            IconButton(
                              iconSize: 50,
                              icon: Icon(
                                audioPlayerState == true
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                              onPressed: () {
                                audioPlayerState == true
                                    ? pauseMusic()
                                    : playMusic(widget.song.url);
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.forward_10,
                                size: 40,
                              ),
                              onPressed: () {
                                audioPlayer.seek(const Duration(seconds: 10));
                              },
                            ),
                            // InkWell(
                            //   child: Icon(Icons.skip_previous_outlined,
                            //       color: Colors.white, size: 40),
                            //   onTap: () {
                            //     player.seekBy(Duration(seconds: -10));
                            //   },
                            // ),
                            // InkWell(
                            //   child: Icon(Icons.skip_previous_outlined,
                            //       color: Colors.white, size: 40),
                            //   onTap: () {
                            //     player.seekBy(Duration(seconds: -10));
                            //   },
                            // ),
                            // GestureDetector(
                            //   onTap: (){
                            //     AnimateIcon();
                            //     // player.play();
                            //   },
                            //   child: AnimatedIcon(
                            //     icon: AnimatedIcons.play_pause,
                            //     progress: iconController,
                            //     size: 50,
                            //     color: Colors.black,
                            //   ),
                            // ),
                            // InkWell(
                            //   child: Icon(Icons.skip_next_outlined,
                            //       color: Colors.white, size: 40),
                            //   onTap: () {
                            //     player.seekBy(Duration(seconds: 10));
                            //   },
                            // ),
                            // InkWell(
                            //   child:
                            //       Icon(Icons.pause,
                            //           color: Colors.white, size: 50),onTap: () {
                            //     // PlayPauseSong();
                            //     player.play();
                            //   },
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

// void AnimateIcon() {
//   setState(() {
//     isAnimated = !isAnimated;
//
//     // isAnimated ? iconController.forward() : iconController.reverse();
//     if (isAnimated) {
//       iconController.forward();
//       player.play();
//     } else {
//       iconController.reverse();
//       player.pause();
//     }
//   });
// }
}
