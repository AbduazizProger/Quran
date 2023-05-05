import 'package:flutter/material.dart';
import 'package:islam/models/suras.dart';

class SurahNameContent extends StatelessWidget {
  const SurahNameContent({
    super.key,
    required this.suras,
    required this.index,
  });

  final List<Suras> suras;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // border: Border.all(
        //   color: Colors.white,
        // ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              suras[index].number.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                // color: Colors.white,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                suras[index].englishName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  // color: Colors.white,
                ),
              ),
              Text(
                suras[index].revelationType,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  // color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              children: [
                Text(
                  suras[index].name,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontFamily: 'ScheherazadeNew',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    // color: Colors.white,
                  ),
                ),
                Text(
                  suras[index].numberOfAyahs.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    // color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
