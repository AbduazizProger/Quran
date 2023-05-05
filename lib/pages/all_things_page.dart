import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:islam/components/settings_page.dart';
import 'package:islam/components/surah_audios_page.dart';
import 'package:islam/pages/surah_names_page.dart';
import 'package:islam/models/suras.dart';

Future<List<Suras>> fetchSuras() async {
  final response = await rootBundle.loadString('assets/json/surah.json');
  List<Suras> suras = [];
  for (var el in jsonDecode(response)['data']) {
    suras.add(Suras.fromJson(el));
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
        backgroundColor: Colors.green,
      ),
      body: definePage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: pageIndex,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        showSelectedLabels: false,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.book_outlined,
                  color: Colors.white,
                ),
                Text(
                  ' Quran',
                  style: TextStyle(color: Colors.amber),
                ),
              ],
            ),
            icon: const Icon(
              Icons.book_outlined,
              color: Colors.white,
            ),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            activeIcon: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.audiotrack_rounded,
                  color: Colors.white,
                ),
                Text(
                  ' Audio',
                  style: TextStyle(color: Colors.amber),
                ),
              ],
            ),
            icon: const Icon(
              Icons.audiotrack_rounded,
              color: Colors.white,
            ),
            label: 'Audio',
          ),
          BottomNavigationBarItem(
            activeIcon: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                Text(
                  ' Settings',
                  style: TextStyle(color: Colors.amber),
                ),
              ],
            ),
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
