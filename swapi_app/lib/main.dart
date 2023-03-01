import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapi_app/shared/config/routes/app_pages.dart';
import 'package:swapi_app/shared/config/theme/app_theme.dart';
import 'package:swapi_app/src/presentation/inital_binding.dart';

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
      initialRoute: AppPages.INITIAL,
      theme: globalTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: InitalBinding(),
    );
  }
}
