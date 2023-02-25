import 'package:flutter/material.dart';
import 'colors_theme_const.dart';

class DefaultTheme {
  static get theme => ThemeData(
        primaryColor: themeBlue,
        primarySwatch: Colors.blue,
        cardColor: const Color.fromARGB(255, 248, 248, 248),
        scaffoldBackgroundColor: const Color.fromARGB(255, 236, 236, 236),
        appBarTheme: const AppBarTheme(
            backgroundColor: themeBlue,
            elevation: 0,
            foregroundColor: Colors.white,
            scrolledUnderElevation: 10),
        textTheme: TextTheme(
            bodyText1: text3,
            bodyText2: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
            )),
        focusColor: themeBlue.withOpacity(0.3),
        splashColor: themeBlue.withOpacity(0.4),
        hoverColor: themeBlue.withOpacity(0.3),
      );
}
