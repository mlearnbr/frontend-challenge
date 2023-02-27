import 'package:flutter/material.dart';

const themeYellow = Color.fromARGB(255, 209, 195, 0);

const themeYellowLight1 = Color.fromARGB(255, 226, 218, 103);

const darkBlue = Color.fromARGB(255, 0, 52, 100);

TextStyle get text1 => const TextStyle(color: themeYellow, fontSize: 14);
TextStyle get text2 => const TextStyle(
    color: themeYellow, fontSize: 11, fontWeight: FontWeight.w300);
TextStyle get text3 => TextStyle(
      color: Colors.grey[700],
      fontSize: 14,
    );
TextStyle get text4 => const TextStyle(color: themeYellow, fontSize: 14);
TextStyle textTitle(color) =>
    TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.bold);

TextStyle get text5 => const TextStyle(color: Colors.white, fontSize: 16);
