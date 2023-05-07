import 'package:flutter/material.dart';
import 'package:islam/models/audio_provider.dart';
import 'package:islam/models/playing_audio.dart';
import 'package:islam/pages/all_things_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: AudioProvider(
        audio: PlayingAudio(),
        child: const AllThingsPage(),
      ),
    );
  }
}
