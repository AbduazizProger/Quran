import 'package:flutter/material.dart';
import 'package:islam/models/surah.dart';

class SurasListProvider extends InheritedWidget {
  const SurasListProvider({
    super.key,
    required this.child,
    required this.suras,
  }) : super(child: child);

  final Widget child;
  final List<Surah> suras;

  static SurasListProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SurasListProvider>();
  }

  @override
  bool updateShouldNotify(SurasListProvider oldWidget) {
    return true;
  }
}
