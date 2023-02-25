import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/splash/splash_page.dart';
import 'routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.route,
      initialRoute: SplashPage.routName,
    );
  }
}
