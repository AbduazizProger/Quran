import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:islam/pages/settings_page.dart';
import 'package:islam/pages/surah_audios_page.dart';
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
      ),
      body: definePage(),
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
        items: [
          BottomNavigationBarItem(
            activeIcon: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.book_outlined,
                  color: Colors.blueGrey,
                  size: 30,
                ),
                Text(
                  ' Quran',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            icon: const Icon(
              Icons.book_outlined,
              color: Colors.black,
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
                  color: Colors.blueGrey,
                  size: 30,
                ),
                Text(
                  ' Audio',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            icon: const Icon(
              Icons.audiotrack_rounded,
              color: Colors.black,
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
                  color: Colors.blueGrey,
                  size: 30,
                ),
                Text(
                  ' Settings',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
