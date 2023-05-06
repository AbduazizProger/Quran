import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islam/components/surah_content_widget.dart';
import 'package:islam/models/ayah.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<Ayah>> fetchSurah(int index) async {
  final response =
      await rootBundle.loadString('assets/json/surah_${index + 1}.json');
  List<Ayah> ayas = [];
  for (var el in jsonDecode(response)['data']['ayahs']) {
    ayas.add(Ayah.fromJson(el));
  }
  return ayas;
}

class SurahPage extends StatefulWidget {
  const SurahPage({super.key, required this.surahIndex, required this.name});

  final int surahIndex;
  final String name;

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 10) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.name,
            style: const TextStyle(fontSize: 35),
          ),
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          child: FutureBuilder(
            future: fetchSurah(widget.surahIndex),
            builder:
                (BuildContext context, AsyncSnapshot<List<Ayah>> snapshot) {
              if (snapshot.hasData) {
                List<Ayah> ayas = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SurahContentWidget(ayas: ayas),
                );
              } else if (snapshot.hasError) {
                return Text(
                  '${snapshot.error}',
                  style: const TextStyle(color: Colors.black),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
