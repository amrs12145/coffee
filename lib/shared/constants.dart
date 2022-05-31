import 'package:flutter/material.dart';

class Constants {
  static const EdgeInsets padding = EdgeInsets.all(16.0);
  static const Widget verticleSpacing = SizedBox(height: 16.0);
  static const Widget verticleSpacingS = SizedBox(height: 6.0);
  static const Widget horizontalSpacing = SizedBox(width: 16.0);
  static Color? primary = Colors.brown[600];
  static BorderRadius radius = const BorderRadius.all(Radius.circular(16));

  static TextStyle headlineStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: Colors.brown[900],
  );
  static TextStyle textStyle = TextStyle(
    color: Colors.grey.shade700,
    fontSize: 20,
  );
  static const TextStyle textStyle2 = TextStyle(
    color: Colors.black,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const String local = 'https://6295407563b5d108c19bf06c.mockapi.io/';
}
