import 'package:flutter/material.dart';

final ThemeData globalTheme = ThemeData(
  scaffoldBackgroundColor: Colors.transparent,
  primaryColor: Colors.deepPurple,
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: MaterialStateProperty.all(
      Colors.deepPurple,
    ),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.deepPurple,
  ),
);
