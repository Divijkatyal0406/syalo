// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:syalo/screens/login_signup.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    _videoPlayerController.setLooping(false);
  }
Future<VideoPlayerController> getController() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(false);
    return _videoPlayerController;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          FutureBuilder(
              future: getController(),
              builder: (context,
                  AsyncSnapshot<VideoPlayerController> playerSnapshot) {
                if (playerSnapshot.hasData) {
                  playerSnapshot.data!.play();

                  return playerSnapshot.connectionState ==
                          ConnectionState.waiting
                      ? Center(child: CircularProgressIndicator())
                      : playerSnapshot.connectionState == ConnectionState.done
                          ? SizedBox.expand(
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: SizedBox(
                                  width:
                                      _videoPlayerController.value.size.width,
                                  height:
                                      _videoPlayerController.value.size.height,
                                  child: VideoPlayer(_videoPlayerController),
                                ),
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                semanticsLabel: "Loading",
                              ),
                            );
                } else if (playerSnapshot.hasError) {
                  return Center(
                    child: IconButton(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: Icon(Icons.star)),
                  );
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                    semanticsLabel: "Loading",
                  ));
                }
              }),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => LoginSignupScreen()));
                },
                child: Text("skip >>")),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        horizontal: width * .3, vertical: 18.0)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => LoginSignupScreen()));
                  },
                  child: Text("Next")),
            ),
          )
        ],
      ),
    ),);
  }
}
