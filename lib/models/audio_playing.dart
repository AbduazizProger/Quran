import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlaying extends InheritedWidget {
  const AudioPlaying({super.key, required this.audio, required this.child})
      : super(child: child);

  final Widget child;
  final AudioPlayer audio;

  static AudioPlaying? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AudioPlaying>();
  }

  @override
  bool updateShouldNotify(AudioPlaying oldWidget) {
    return true;
  }
}
