import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapi_app/src/config/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Swapi",
      getPages: AppPages.pages,
      initialRoute: AppPages.HOME,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
