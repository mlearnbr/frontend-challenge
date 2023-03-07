import 'package:flutter/material.dart';

class AppTheme {
  static const MaterialColor _theme = MaterialColor(
    0XFFffee58,
    {
      50: Color(0XFFe6d64f),
      100: Color(0XFFccbe46),
      200: Color(0XFFb3a73e),
      300: Color(0XFF998f35),
      400: Color(0XFF80772c),
      500: Color(0XFF665f23),
      600: Color(0XFF4c471a),
      700: Color(0XFF333012),
      800: Color(0XFF191809),
      900: Color(0XFF000000),
    },
  );

  static final ThemeData themeData = ThemeData(
    primaryColor: const Color(0XFF000000),
    primarySwatch: _theme,
  );
}
