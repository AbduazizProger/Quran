import 'package:flutter/material.dart';
import 'package:islam/models/playing_audio.dart';

class AudioProvider extends InheritedWidget {
  const AudioProvider({
    super.key,
    required this.audio,
    required this.child,
  }) : super(child: child);

  final Widget child;
  final PlayingAudio audio;

  static AudioProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AudioProvider>();
  }

  @override
  bool updateShouldNotify(AudioProvider oldWidget) {
    return audio.url != oldWidget.audio.url;
  }
}
