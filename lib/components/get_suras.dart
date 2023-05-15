import 'package:flutter/material.dart';
import 'package:islam/models/surah.dart';
import 'package:islam/models/suras_list_provider.dart';
import 'package:islam/pages/all_things_page.dart';
import 'package:islam/pages/settings_page.dart';
import 'package:islam/pages/surah_audios_page.dart';
import 'package:islam/pages/surah_names_page.dart';

class GetAllSuras extends StatelessWidget {
  const GetAllSuras({super.key, required this.pageIndex});

  final int pageIndex;

  Widget definePage() {
    if (pageIndex == 2) {
      return const SettingsPage();
    } else if (pageIndex == 1) {
      return const SurahAudiosPage();
    } else {
      return const SurahNamesPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchSuras(),
        builder: (BuildContext context, AsyncSnapshot<List<Surah>> snapshot) {
          if (snapshot.hasData) {
            List<Surah> suras = snapshot.data!;
            return SurasListProvider(
              suras: suras,
              child: definePage(),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
