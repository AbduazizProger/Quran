import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islam/models/surah.dart';
import 'package:http/http.dart' as http;

Future<List<Surah>> fetchSurah(int index) async {
  final response = await http
      .get(Uri.parse('http://api.alquran.cloud/v1/surah/${index + 1}'));
  if (response.statusCode == 200) {
    List<Surah> ayas = [];
    for (var el in jsonDecode(response.body)['data']['ayahs']) {
      ayas.add(Surah.fromJson(el));
    }
    return ayas;
  } else {
    throw Exception('Failed to load suras');
  }
}

class SurahWidget extends StatefulWidget {
  const SurahWidget({super.key, required this.surahIndex, required this.name});

  final int surahIndex;
  final String name;

  @override
  State<SurahWidget> createState() => _SurahWidgetState();
}

class _SurahWidgetState extends State<SurahWidget> {
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
                    child: ListView.builder(
                      itemCount: ayas.length,
                      itemBuilder: (context, index) {
                        String text = ayas[index].text;
                        if (text.contains(
                            "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ")) {
                          text = text.split(
                              "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ")[1];
                          if (text == '\n') {
                            text = '';
                          }
                          return Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                  ),
                                ),
                              ),
                              Text(
                                text,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                ),
                              ),
                            ],
                          );
                        }
                        return Center(
                          child: Text(
                            text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    '${snapshot.error}',
                    style: const TextStyle(color: Colors.white),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }
}
