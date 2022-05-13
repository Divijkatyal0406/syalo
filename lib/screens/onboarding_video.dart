import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class OnboardingVideo extends StatefulWidget {
  const OnboardingVideo({Key? key}) : super(key: key);

  @override
  _OnboardingVideoState createState() => _OnboardingVideoState();
}

class _OnboardingVideoState extends State<OnboardingVideo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.black,
            onPressed: () {},
            child: const Text(
              "Skip",
              style: TextStyle(fontSize: 20),
            ),
            shape:
                const CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: deviceRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
