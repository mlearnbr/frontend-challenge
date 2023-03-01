import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/home/home_binding.dart';
import 'modules/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      initialBinding: HomeBinding(),
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.black54,
          secondary: Colors.yellow.withOpacity(0.2),
          error: Colors.red,
          onError: Colors.red,
        ),
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 20,
            color: Colors.yellow,
          ),
          displayMedium: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.yellow),
          titleTextStyle: TextStyle(
            fontSize: 22,
            color: Colors.yellow,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
