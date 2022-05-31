// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffe/shared/constants.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _value,
      onTap: (value) {
        setState(() {
          _value = value;
        });
      },
      selectedItemColor: Constants.primary,
      selectedFontSize: 0,
      selectedIconTheme: IconThemeData(
        color: Constants.primary,
        size: 30,
      ),
      iconSize: 30,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.production_quantity_limits),
          label: '',
        ),
      ],
    );
  }
}
