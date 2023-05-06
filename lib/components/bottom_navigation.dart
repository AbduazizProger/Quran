import 'package:flutter/material.dart';

List<BottomNavigationBarItem> allNavigators() {
  return [
    BottomNavigationBarItem(
      activeIcon: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
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
      icon: const Icon(
        Icons.book_outlined,
        color: Colors.black,
      ),
      label: 'Quran',
    ),
    BottomNavigationBarItem(
      activeIcon: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
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
      icon: const Icon(
        Icons.audiotrack_rounded,
        color: Colors.black,
      ),
      label: 'Audio',
    ),
    BottomNavigationBarItem(
      activeIcon: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.settings,
            color: Colors.blueGrey,
            size: 30,
          ),
          Text(
            ' Settings',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      icon: const Icon(
        Icons.settings,
        color: Colors.black,
      ),
      label: 'Settings',
    ),
  ];
}
