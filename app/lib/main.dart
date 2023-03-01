import 'package:flutter/material.dart';

import 'package:flutter_application/core/config/injection/injection.config.dart';
import 'package:flutter_application/core/config/injection/injection.dart';
import 'package:flutter_application/core/config/theme/app_theme.dart';
import 'core/config/route/app_route.dart';
import 'core/constants/globals.dart';

void main() {
  getIt.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      theme: makeAppTheme(),
      routes: makeAppRoute(),
      scaffoldMessengerKey: snackbarKey,
    );
  }
}
