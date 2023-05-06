import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:islam/components/bottom_navigation.dart';
import 'package:islam/models/suras_list_provider.dart';
import 'package:islam/pages/settings_page.dart';
import 'package:islam/pages/surah_audios_page.dart';
import 'package:islam/pages/surah_names_page.dart';
import 'package:islam/models/surah.dart';

Future<List<Surah>> fetchSuras() async {
  final response = await rootBundle.loadString('assets/json/surah.json');
  List<Surah> suras = [];
  for (var el in jsonDecode(response)['data']) {
    suras.add(Surah.fromJson(el));
  }
  return suras;
}

class AllThingsPage extends StatefulWidget {
  const AllThingsPage({super.key});

  @override
  State<AllThingsPage> createState() => _AllThingsPageState();
}

class _AllThingsPageState extends State<AllThingsPage> {
  int pageIndex = 0;

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
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(bottom: 15.0),
          child: Text(
            "القرآن",
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 35,
              fontFamily: 'ScheherazadeNew',
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
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
          }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        currentIndex: pageIndex,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        showSelectedLabels: false,
        elevation: 0,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: allNavigators(),
      ),
    );
  }
}
