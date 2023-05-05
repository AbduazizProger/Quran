import 'package:flutter/material.dart';
import 'package:islam/components/surah_name_widget.dart';
import 'package:islam/models/suras.dart';
import 'package:islam/pages/all_things_page.dart';

class SurahNamesPage extends StatelessWidget {
  const SurahNamesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: FutureBuilder(
        future: fetchSuras(),
        builder: (BuildContext context, AsyncSnapshot<List<Suras>> snapshot) {
          if (snapshot.hasData) {
            List<Suras> suras = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView.builder(
                itemCount: suras.length,
                itemBuilder: (BuildContext context, int index) {
                  return SurahNameWidget(suras: suras, index: index);
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
