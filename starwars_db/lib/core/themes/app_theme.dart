import 'package:flutter/material.dart';

final appThemeData = {
  AppTheme.dark: _baseTheme(Brightness.dark).copyWith(),
};

ThemeData _baseTheme(Brightness brightness) {
  final theme = ThemeData(brightness: brightness);
  return theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(
      primary: const Color(0xFFFFE81F),
      secondary: const Color(0xFFFFE81F),
      onSecondary: Colors.white,
      onPrimary: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: theme.appBarTheme.copyWith(
      backgroundColor: Colors.transparent,
    ),
    textTheme: theme.textTheme.copyWith(
      bodyLarge: const TextStyle(fontSize: 16),
    ),
  );
}

enum AppTheme {
  dark,
}
