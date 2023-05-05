import 'package:flutter/material.dart';
import 'package:islam/models/surah.dart';

class SurahContentWidget extends StatelessWidget {
  const SurahContentWidget({
    super.key,
    required this.ayas,
  });

  final List<Surah> ayas;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ayas.length,
      itemBuilder: (context, index) {
        String text = ayas[index].text;
        if (text.contains("بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ") ||
            text.contains('بِّسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ')) {
          if (text.contains("بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ")) {
            text = text.split("بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ")[1];
          } else {
            text = text.split("بِّسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ")[1];
          }
          if (text.contains('\n')) {
            text = text.split('\n')[0];
          }
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: 'ScheherazadeNew',
                    color: Colors.white,
                    fontSize: 27,
                  ),
                ),
              ),
              text != '' && text != '\n'
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '$text ۝',
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontFamily: 'ScheherazadeNew',
                          color: Colors.white,
                          fontSize: 23,
                          height: 2.25,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          );
        }
        if (text.contains('\n')) {
          text = text.split('\n')[0];
        }
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '$text ۝',
              textDirection: TextDirection.rtl,
              textHeightBehavior: const TextHeightBehavior(
                applyHeightToFirstAscent: false,
                applyHeightToLastDescent: false,
              ),
              style: const TextStyle(
                fontFamily: 'ScheherazadeNew',
                color: Colors.white,
                fontSize: 23,
                height: 2.25,
              ),
            ),
          ),
        );
      },
    );
  }
}
