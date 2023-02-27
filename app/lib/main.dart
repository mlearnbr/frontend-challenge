import 'package:flutter/material.dart';
import 'package:flutter_application/core/config/router/app_router.dart';
import 'package:flutter_application/core/config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      restorationScopeId: 'app',
      theme: makeAppTheme(),
    );
  }
}
