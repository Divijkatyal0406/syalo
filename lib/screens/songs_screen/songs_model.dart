import 'package:flutter/material.dart';

class Song {
  final String name;
  final String singer;
  final String image;
  final int duration;
  final Color color;
  final String url;

  Song(
      {required this.name,
      required this.singer,
      required this.image,
      required this.duration,
      required this.color,
      required this.url});
}

class SongsContainer {
  List<Song> mostPopular = [
    Song(
        name: "Adventure",
        image: "assets/song1.jpg",
        singer: "Charle Cardin",
        duration: 300,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014667/Sounds/Rain_nkgmgr.mp3"),
    Song(
        name: "Rain",
        image: "assets/song2.jpg",
        singer: "Tvorchi",
        duration: 252,
        color: Colors.red,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014667/Sounds/Rain_nkgmgr.mp3"),
    Song(
        name: "Piano Rain",
        image: "assets/song3.jpg",
        singer: "danito & athina",
        duration: 532,
        color: Colors.orange,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014682/Sounds/Piano_Rain_rhavga.mp3"),
    Song(
        name: "nature walk",
        image: "assets/song4.jpg",
        singer: "ley you",
        duration: 264,
        color: Colors.blue,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014743/Sounds/Calm_Nature_Walk_jpt7fu.mp3"),
    Song(
        name: "Fireplace",
        image: "assets/song5.jpg",
        singer: "ley you",
        duration: 264,
        color: Colors.blue,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643015093/Sounds/fireplace_zkswog.mp3"),
    Song(
        name: "Soft serene",
        image: "assets/song6.jpg",
        singer: "ley you",
        duration: 264,
        color: Colors.blue,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014661/Sounds/Soft_Serene_Meditation_szikfi.mp3"),
    Song(
        name: "Deep calm",
        image: "assets/song7.jpg",
        singer: "ley you",
        duration: 264,
        color: Colors.blue,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014726/Sounds/Windy_Ocean_vpb5mh.mp3"),
    Song(
        name: "Ocean",
        image: "assets/song8.jpg",
        singer: "ley you",
        duration: 264,
        color: Colors.blue,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014726/Sounds/Windy_Ocean_vpb5mh.mp3"),
    Song(
        name: "Monk",
        image: "assets/song9.jpg",
        singer: "ley you",
        duration: 264,
        color: Colors.blue,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014794/Sounds/medi_music_mfhpzh.mp3")
  ];

  List<Song> newRelease = [
    Song(
        name: "Beach",
        image: "assets/song10.jpg",
        singer: "ley you",
        duration: 264,
        color: Colors.blue,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014827/Sounds/calm_ocean_avtlj3.mp4"),
    Song(
        name: "Rain",
        image: "assets/song2.jpg",
        singer: "Tvorchi",
        duration: 252,
        color: Colors.red,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014667/Sounds/Rain_nkgmgr.mp3"),
    Song(
      name: "Adventure",
      image: "assets/song1.jpg",
      singer: "Charle Cardin",
      duration: 300,
      color: Colors.grey,
      url:
          "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014783/Sounds/Beautiful_Adventure_e9vk7e.mp4",
    ),
    Song(
        name: "Nature Walk",
        image: "assets/song4.jpg",
        singer: "ley you",
        duration: 264,
        color: Colors.blue,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014743/Sounds/Calm_Nature_Walk_jpt7fu.mp3"),
    Song(
        name: "Piano Rain",
        image: "assets/song3.jpg",
        singer: "danito & athina",
        duration: 532,
        color: Colors.orange,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014682/Sounds/Piano_Rain_rhavga.mp3"),
  ];
}
