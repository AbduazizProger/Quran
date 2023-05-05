import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islam/components/surah_content_widget.dart';
import 'package:islam/models/surah.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<Surah>> fetchSurah(int index) async {
  final response =
      await rootBundle.loadString('assets/json/surah_${index + 1}.json');
  List<Surah> ayas = [];
  for (var el in jsonDecode(response)['data']['ayahs']) {
    ayas.add(Surah.fromJson(el));
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
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Container(
          color: Colors.black,
          child: FutureBuilder(
            future: fetchSurah(widget.surahIndex),
            builder:
                (BuildContext context, AsyncSnapshot<List<Surah>> snapshot) {
              if (snapshot.hasData) {
                List<Surah> ayas = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SurahContentWidget(ayas: ayas),
                );
              } else if (snapshot.hasError) {
                return Text(
                  '${snapshot.error}',
                  style: const TextStyle(color: Colors.white),
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
