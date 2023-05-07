import 'package:flutter/material.dart';
import 'package:islam/components/surah_audio_player.dart';
import 'package:islam/components/surah_name_widget.dart';
import 'package:islam/models/surah.dart';
import 'package:islam/models/suras_list_provider.dart';

class SurahNamesPage extends StatelessWidget {
  const SurahNamesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Surah> suras = SurasListProvider.of(context)?.suras ?? [];
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListView.builder(
              itemCount: suras.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index != suras.length) {
                  return SurahNameWidget(suras: suras, index: index);
                } else {
                  return const SizedBox(height: 60);
                }
              },
            ),
          ),
        ),
        const SurahAudioPlayer(),
      ],
    );
  }
}
