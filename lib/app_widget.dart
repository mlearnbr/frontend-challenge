import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/splash/splash_page.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.route,
      initialRoute: SplashPage.routName,
    );
  }
}
