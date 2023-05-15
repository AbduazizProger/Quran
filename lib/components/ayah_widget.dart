import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islam/models/ayah.dart';
import 'package:http/http.dart' as http;

Future<bool> checkInternetConnection() async {
  try {
    var response = await http.head(Uri.parse('https://www.example.com'));
    return response.statusCode == 200;
  } catch (e) {
    return false;
  }
}

class AyahWidget extends StatelessWidget {
  const AyahWidget({
    super.key,
    required this.text,
    required this.ayas,
    required this.index,
    required this.shouldMinus,
  });

  final int index;
  final String text;
  final List<Ayah> ayas;
  final bool shouldMinus;

  @override
  Widget build(BuildContext context) {
    final audio = AudioPlayer();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 12,
                  spreadRadius: 4,
                  offset: Offset(5, 7),
                  color: Colors.grey,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          color: !text.contains(
                                  'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ')
                              ? Colors.black
                              : Colors.white,
                          size: 40,
                        ),
                        Text(
                          !shouldMinus
                              ? ayas[index].numberInSurah.toString()
                              : ayas[index].numberInSurah == 7
                                  ? '6-7'
                                  : (ayas[index].numberInSurah - 1).toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    !text.contains('بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ')
                        ? IconButton(
                            icon: const Icon(Icons.play_arrow_rounded),
                            onPressed: () async {
                              bool isConnected =
                                  await checkInternetConnection();
                              if (isConnected) {
                                if (audio.state != PlayerState.playing) {
                                  audio.play(
                                    UrlSource(
                                      'https://cdn.islamic.network/quran/audio/64/ar.alafasy/${ayas[index].number}.mp3',
                                    ),
                                  );
                                }
                              } else {
                                // ignore: use_build_context_synchronously
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    icon:
                                        const Icon(Icons.signal_wifi_bad_sharp),
                                    title: const Text('No internet connection'),
                                    content: const Text(
                                      'Please connect to internet for playing audio',
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: [
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          )
                        : const SizedBox(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    textHeightBehavior: const TextHeightBehavior(
                      applyHeightToFirstAscent: false,
                      applyHeightToLastDescent: false,
                    ),
                    style: const TextStyle(
                      fontFamily: 'ScheherazadeNew',
                      color: Colors.black,
                      fontSize: 23,
                      height: 2.25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
