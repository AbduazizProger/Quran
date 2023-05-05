import 'package:flutter/material.dart';
import 'package:islam/components/surah_name_content.dart';
import 'package:islam/models/suras.dart';
import 'package:islam/pages/surah_page.dart';

class SurahNameWidget extends StatelessWidget {
  const SurahNameWidget({
    super.key,
    required this.suras,
    required this.index,
  });

  final List<Suras> suras;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 500,
            maxHeight: 80,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 300),
                  pageBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                  ) =>
                      SurahPage(
                    surahIndex: index,
                    name: suras[index].englishName,
                  ),
                  transitionsBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                ),
              );
            },
            child: SurahNameContent(suras: suras, index: index),
          ),
        ),
      ),
    );
  }
}
