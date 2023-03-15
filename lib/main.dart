import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'Core/styles/app_colors.dart';
import 'app_module.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Desafio',
      theme: ThemeData.light().copyWith(
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Jedi',
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
              fontSize: 16.0, fontFamily: 'Jedi', color: Colors.white),
          titleMedium: TextStyle(
              fontSize: 18.0, fontFamily: 'Jedi', color: Colors.white),
          titleLarge: TextStyle(
              fontSize: 20.0, fontFamily: 'Jedi', color: Colors.white),
        ),
        //Cor do texto
        hintColor: kTextColor,
        //Cor do card
        cardColor: kCardColor,
        //Icones do usuario
        primaryColorDark: kUsersIconColor,
        //Tema da AppBar
        appBarTheme: kAppBarTheme,
        //Cor de plano de fundo
        scaffoldBackgroundColor: kBackGroundColor,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
