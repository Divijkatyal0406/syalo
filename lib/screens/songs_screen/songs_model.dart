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
  Map<String, List<Song>> getAllSongs = {
    "Trending": [
      Song(
        name: "Rain",
        singer: "Unknown",
        image: "assets/music_images/rain.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014667/Sounds/Rain_nkgmgr.mp3",
      ),
      Song(
        name: "Nature Walk",
        singer: "Unknown",
        image: "assets/music_images/nature_walk.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014743/Sounds/Calm_Nature_Walk_jpt7fu.mp3",
      ),
      Song(
        name: "Snowy Piano",
        singer: "Unknown",
        image: "assets/music_images/snowy_piano.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014756/Sounds/Snowy_Piano_j0u6cj.mp4",
      ),
      Song(
        name: "Temple Mind",
        singer: "Unknown",
        image: "assets/music_images/temple_mind.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014726/Sounds/Mountain_Temple_Meditation_unrdd1.mp3",
      ),
      Song(
        name: "Art of Silence",
        singer: "Unknown",
        image: "assets/music_images/art_of_silence.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014660/Sounds/Art_Of_Silence_bcjelc.mp3",
      ),
    ],
    "Nature": [
      Song(
        name: "Fireplace",
        singer: "Unknown",
        image: "assets/music_images/fireplace.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643015093/Sounds/fireplace_zkswog.mp3",
      ),
      Song(
        name: "Rain",
        singer: "Unknown",
        image: "assets/music_images/rain.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014667/Sounds/Rain_nkgmgr.mp3",
      ),
      Song(
        name: "Piano Rain",
        singer: "Unknown",
        image: "assets/music_images/piano_rain.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014682/Sounds/Piano_Rain_rhavga.mp3",
      ),
      Song(
        name: "Ocean",
        singer: "Unknown",
        image: "assets/music_images/ocean.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014726/Sounds/Windy_Ocean_vpb5mh.mp3",
      ),
      Song(
        name: "Beach",
        singer: "Unknown",
        image: "assets/music_images/beach.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014827/Sounds/calm_ocean_avtlj3.mp4",
      ),
      Song(
        name: "Nature Walk",
        singer: "Unknown",
        image: "assets/music_images/nature_walk.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014743/Sounds/Calm_Nature_Walk_jpt7fu.mp3",
      ),
      Song(
        name: "River Forest",
        singer: "Unknown",
        image: "assets/music_images/river_forest.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014679/Sounds/River_Forest_yoaiqj.mp3",
      ),
      Song(
        name: "Forest",
        singer: "Unknown",
        image: "assets/music_images/forest.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014677/Sounds/Forest_Sounds_bj33ui.mp3",
      ),
    ],
    "Calming": [
      Song(
        name: "Soft Seren",
        singer: "Unknown",
        image: "assets/music_images/soft_seren.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014661/Sounds/Soft_Serene_Meditation_szikfi.mp3",
      ),
      Song(
        name: "Deep Calm",
        singer: "Unknown",
        image: "assets/music_images/deep_calm.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014812/Sounds/deep_calm_iofc6f.mp4",
      ),
      Song(
        name: "Adventure",
        singer: "Unknown",
        image: "assets/music_images/adventure.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014783/Sounds/Beautiful_Adventure_e9vk7e.mp4",
      ),
    ],
    "Meditation": [
      Song(
        name: "Piano",
        singer: "Unknown",
        image: "assets/music_images/piano.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014660/Sounds/piano_rygrgv.mp3",
      ),
      Song(
        name: "Snowy Piano",
        singer: "Unknown",
        image: "assets/music_images/snowy_piano.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014756/Sounds/Snowy_Piano_j0u6cj.mp4",
      ),
      Song(
        name: "Monk",
        singer: "Unknown",
        image: "assets/music_images/monk.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014794/Sounds/medi_music_mfhpzh.mp3",
      ),
      Song(
        name: "Calm Piano",
        singer: "Unknown",
        image: "assets/music_images/calm_piano.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014654/Sounds/calm_piano_ul9elx.mp3",
      ),
    ],
    "Focus": [
      Song(
        name: "Temple Mind",
        singer: "Unknown",
        image: "assets/music_images/temple_mind.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014726/Sounds/Mountain_Temple_Meditation_unrdd1.mp3",
      ),
      Song(
        name: "Art of Silence",
        singer: "Unknown",
        image: "assets/music_images/art_of_silence.jpg",
        duration: 0,
        color: Colors.grey,
        url:
            "https://res.cloudinary.com/dhrju5vsa/video/upload/v1643014660/Sounds/Art_Of_Silence_bcjelc.mp3",
      ),
    ],
  };
}
