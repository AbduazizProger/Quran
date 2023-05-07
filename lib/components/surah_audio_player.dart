import 'package:flutter/material.dart';

class SurahAudioPlayer extends StatelessWidget {
  const SurahAudioPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 200,
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
              children: const [
                Text('Al-Faatiha'),
                Icon(Icons.play_arrow_rounded),
              ],
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
