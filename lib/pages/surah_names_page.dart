import 'package:flutter/material.dart';
import 'package:islam/components/about_quran.dart';
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
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView.builder(
          itemCount: suras.length + 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return const AboutQuran();
            } else if (index != suras.length + 1) {
              return SurahNameWidget(suras: suras, index: index - 1);
            } else {
              return const SizedBox(height: 20);
            }
          },
        ),
      ),
    );
  }
}
