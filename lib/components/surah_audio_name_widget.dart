import 'package:flutter/material.dart';
import 'package:islam/models/surah.dart';

class SurahAudioNameWidget extends StatelessWidget {
  const SurahAudioNameWidget({
    super.key,
    required this.suras,
    required this.index,
  });

  final List<Surah> suras;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 12,
            spreadRadius: 4,
            offset: Offset(5, 7),
            color: Colors.grey,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              suras[index].number.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                suras[index].englishName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                suras[index].name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.play_arrow_rounded,
              color: Colors.indigo,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
