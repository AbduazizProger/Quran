import 'package:flutter/material.dart';
import 'package:islam/components/ayah_widget.dart';
import 'package:islam/models/ayah.dart';

class SurahContentWidget extends StatelessWidget {
  const SurahContentWidget({
    super.key,
    required this.ayas,
  });

  final List<Ayah> ayas;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ayas.length,
        itemBuilder: (context, index) {
          String text = ayas[index].text;
          if (ayas[0].text == 'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ\n') {
            return AyahWidget(
              text: index == 0
                  ? 'أَعُوذُ بالله مِنَ الشَّيْطَانِ الرَّجِيمِ\n$text'
                  : text,
              ayas: ayas,
              index: index,
              shouldMinus: true,
            );
          }
          return text.contains('بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ') ||
                  text.contains('بِّسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ')
              ? Column(
                  children: [
                    AyahWidget(
                      text: 'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ\n',
                      ayas: ayas,
                      index: index,
                      shouldMinus: false,
                    ),
                    AyahWidget(
                      text: !text.contains(
                              'بِّسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ')
                          ? text.split(
                              'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ')[1]
                          : text.split(
                              'بِّسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ')[1],
                      ayas: ayas,
                      index: index,
                      shouldMinus: false,
                    ),
                  ],
                )
              : AyahWidget(
                  text: text,
                  ayas: ayas,
                  index: index,
                  shouldMinus: false,
                );
        });
  }
}
