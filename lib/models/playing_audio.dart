import 'package:flutter/material.dart';

class PlayingAudio extends ChangeNotifier {
  String url =
      "https://cdn.islamic.network/quran/audio-surah/128/ar.abdulbasitmujawwad/1.mp3";

  void changeUrl(int number) {
    url =
        "https://cdn.islamic.network/quran/audio-surah/128/ar.abdulbasitmujawwad/$number.mp3";
    notifyListeners();
  }
}
