import 'package:flutter/material.dart';
import 'colors_theme_const.dart';

class DefaultTheme {
  static get light => ThemeData(
        primaryColor: themeYellow,
        primarySwatch: Colors.yellow,
        cardColor: const Color.fromARGB(255, 248, 248, 248),
        scaffoldBackgroundColor: const Color.fromARGB(255, 236, 236, 236),
        appBarTheme: const AppBarTheme(
            backgroundColor: themeYellow,
            elevation: 0,
            foregroundColor: Colors.white,
            scrolledUnderElevation: 10),
        textTheme: TextTheme(
            bodyText1: text3,
            bodyText2: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
            )),
        focusColor: themeYellow.withOpacity(0.3),
        splashColor: themeYellow.withOpacity(0.4),
        hoverColor: themeYellow.withOpacity(0.3),
      );

  static ThemeData get dark => ThemeData(
        primaryColor: themeYellow,
        primarySwatch: Colors.yellow,
        cardColor: const Color.fromARGB(255, 24, 24, 24),
        scaffoldBackgroundColor: const Color.fromARGB(255, 12, 12, 12),
        iconTheme: IconThemeData(color: Colors.grey[500]),
        appBarTheme: const AppBarTheme(
            backgroundColor: themeYellow,
            elevation: 0,
            foregroundColor: Colors.white,
            scrolledUnderElevation: 10),
        textTheme: TextTheme(
            bodyText1: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.w300,
                fontSize: 13),
            bodyText2: TextStyle(
              color: Colors.grey[200],
              fontWeight: FontWeight.w400,
            ),
            headline4: TextStyle(
              color: Colors.grey[300],
            ),
            headline5: const TextStyle(
                color: themeYellow, fontWeight: FontWeight.w300, fontSize: 16),
            headline6: TextStyle(
                color: Colors.grey[200],
                fontWeight: FontWeight.w500,
                fontSize: 16)),
        focusColor: themeYellow.withOpacity(0.3),
        splashColor: themeYellow.withOpacity(0.4),
        hoverColor: themeYellow.withOpacity(0.3),
      );

  static get contrast => ThemeData(
        primaryColor: themeYellow,
        primarySwatch: Colors.yellow,
        cardColor: const Color.fromARGB(255, 15, 15, 15),
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 228, 228, 228)),
        appBarTheme: const AppBarTheme(
            backgroundColor: themeYellow,
            elevation: 0,
            foregroundColor: Colors.white,
            scrolledUnderElevation: 10),
        textTheme: TextTheme(
            bodyText1: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w300,
                fontSize: 14),
            bodyText2: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w400,
            ),
            headline4: TextStyle(
              color: Colors.grey[300],
            ),
            headline5: const TextStyle(
                color: themeYellow, fontWeight: FontWeight.w300, fontSize: 18),
            headline6: TextStyle(
                color: Colors.grey[200],
                fontWeight: FontWeight.w500,
                fontSize: 18)),
        focusColor: themeYellow.withOpacity(0.3),
        splashColor: themeYellow.withOpacity(0.4),
        hoverColor: themeYellow.withOpacity(0.3),
      );
}
