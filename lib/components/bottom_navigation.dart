import 'package:flutter/material.dart';

List<BottomNavigationBarItem> allNavigators() {
  return const [
    BottomNavigationBarItem(
      activeIcon: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.book_outlined,
            color: Colors.blueGrey,
            size: 30,
          ),
          Text(
            ' Quran',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      icon: Icon(
        Icons.book_outlined,
        color: Colors.black,
      ),
      label: 'Quran',
    ),
    BottomNavigationBarItem(
      activeIcon: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.audiotrack_rounded,
            color: Colors.blueGrey,
            size: 30,
          ),
          Text(
            ' Audio',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      icon: Icon(
        Icons.audiotrack_rounded,
        color: Colors.black,
      ),
      label: 'Audio',
    ),
  ];
}
