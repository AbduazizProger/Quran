import 'package:flutter/material.dart';
import 'package:islam/components/surah_audio_name_widget.dart';
import 'package:islam/models/surah.dart';
import 'package:islam/models/suras_list_provider.dart';

class SurahAudiosPage extends StatelessWidget {
  const SurahAudiosPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Surah> suras = SurasListProvider.of(context)?.suras ?? [];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: suras.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SurahAudioNameWidget(
              suras: suras,
              index: index,
            ),
          );
        },
      ),
    );
  }
}
