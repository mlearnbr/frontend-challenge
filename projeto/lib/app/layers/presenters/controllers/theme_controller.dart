import 'package:flutter/foundation.dart';
import 'package:star_wars_app/app/shared/theme/theme.dart';

class ThemeController {
  final themeData = ValueNotifier(DefaultTheme.dark);
  final themeLight = ValueNotifier(false);

  get isContrast => themeData.value == DefaultTheme.contrast;

  setToContrast() {
    themeData.value = DefaultTheme.contrast;
  }

  get isLight => themeData.value == DefaultTheme.light;

  setToLight() {
    themeData.value = DefaultTheme.light;
  }

  setToDark() {
    themeData.value = DefaultTheme.dark;
  }
}
