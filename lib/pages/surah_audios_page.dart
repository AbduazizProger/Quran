import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islam/components/ayah_widget.dart';
import 'package:islam/components/surah_audio_name_widget.dart';
import 'package:islam/components/surah_audio_player.dart';
import 'package:islam/models/audio_playing.dart';
import 'package:islam/models/surah.dart';
import 'package:islam/models/suras_list_provider.dart';

class SurahAudiosPage extends StatefulWidget {
  const SurahAudiosPage({super.key});

  @override
  State<SurahAudiosPage> createState() => _SurahAudiosPageState();
}

class _SurahAudiosPageState extends State<SurahAudiosPage> {
  int numberPlaying = 0;

  @override
  Widget build(BuildContext context) {
    List<Surah> suras = SurasListProvider.of(context)?.suras ?? [];
    AudioPlayer audio = AudioPlaying.of(context)!.audio;
    bool shouldNotify = false;
    void playSurah(int number) async {
      bool isConnected = await checkInternetConnection();
      if (isConnected) {
        if (numberPlaying != 0 && !shouldNotify) {
          audio.play(
            UrlSource(
              'https://server6.mp3quran.net/akdr/00$numberPlaying.mp3',
            ),
          );
        }
      } else {
        // setState(() {
        //   numberPlaying = 0;
        //   audio.stop();
        // });
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            icon: const Icon(Icons.signal_wifi_bad_sharp),
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
    }

    playSurah(numberPlaying);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: suras.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index != suras.length) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      bool isConnected = await checkInternetConnection();
                      setState(() {
                        if (isConnected) {
                          numberPlaying = index + 1;
                        } else {
                          shouldNotify = true;
                        }
                      });
                    },
                    child: SurahAudioNameWidget(
                      suras: suras,
                      index: index,
                    ),
                  ),
                );
              } else {
                return const SizedBox(height: 60);
              }
            },
          ),
        ),
        numberPlaying == 0
            ? const SizedBox()
            : SurahAudioPlayer(
                surahName: suras[numberPlaying - 1].englishName,
                number: numberPlaying,
                audio: audio,
              ),
      ],
    );
  }
}
