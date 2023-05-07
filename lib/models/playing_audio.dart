import 'package:flutter/material.dart';

class PlayingAudio extends ChangeNotifier {
  String url = "";

  void changeUrl(int number) {
    url =
        "https://cdn.islamic.network/quran/audio-surah/128/ar.abdulbasitmujawwad/$number.mp3";
    notifyListeners();
  }
}
