import 'package:flutter/material.dart';

import 'shared/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persons Star Wars',
      theme: DefaultTheme.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Material(),
        '/home': (context) => const Scaffold(),
      },
    );
  }
}
