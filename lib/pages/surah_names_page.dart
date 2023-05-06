import 'package:flutter/material.dart';
import 'package:islam/components/surah_name_widget.dart';
import 'package:islam/models/surah.dart';
import 'package:islam/models/suras_list_provider.dart';
import 'package:islam/pages/all_things_page.dart';

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
          itemCount: suras.length,
          itemBuilder: (BuildContext context, int index) {
            return SurahNameWidget(suras: suras, index: index);
          },
        ),
      ),
    );
  }
}
