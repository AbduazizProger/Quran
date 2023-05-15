import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:islam/components/bottom_navigation.dart';
import 'package:islam/components/get_suras.dart';
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

  List<Widget> pages = const [
    GetAllSuras(pageIndex: 0),
    GetAllSuras(pageIndex: 1),
    GetAllSuras(pageIndex: 2),
  ];

  Widget definePage() {
    if (pageIndex == 1) {
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
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
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
