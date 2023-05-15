import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SurahAudioPlayer extends StatefulWidget {
  const SurahAudioPlayer({
    super.key,
    required this.surahName,
    required this.number,
    required this.audio,
  });

  final String surahName;
  final int number;
  final AudioPlayer audio;

  @override
  State<SurahAudioPlayer> createState() => _SurahAudioPlayerState();
}

class _SurahAudioPlayerState extends State<SurahAudioPlayer> {
  AudioPlayer? player;
  bool isPlaying = true;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    duration = Duration.zero;
    position = Duration.zero;
    player = widget.audio;
    player!.onDurationChanged.listen((duration) {
      setState(() {
        this.duration = duration;
      });
    });
    player!.onPositionChanged.listen((position) {
      setState(() {
        this.position = position;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 230,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 12,
                  spreadRadius: 0,
                  offset: Offset(0, 0),
                  color: Colors.black,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.surahName),
                Text(position.toString().split('.')[0]),
                IconButton(
                  icon:
                      Icon(isPlaying ? Icons.pause : Icons.play_arrow_rounded),
                  onPressed: () {
                    if (isPlaying) {
                      player!.pause();
                      setState(() {
                        isPlaying = false;
                      });
                    } else {
                      player!.resume();
                      setState(() {
                        isPlaying = true;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
