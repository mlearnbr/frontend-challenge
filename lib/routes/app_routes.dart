import 'package:get/get.dart';

import '../presentation/home/home_bindings.dart';
import '../presentation/home/home_page.dart';
import '../presentation/splash/splash_bindings.dart';
import '../presentation/splash/splash_page.dart';

class AppRoutes {
  static final List<GetPage> route = [
    GetPage(
        name: SplashPage.routName,
        page: () => const SplashPage(),
        binding: SplashBindings()),
    GetPage(
        name: HomePage.routName,
        page: () => const HomePage(),
        binding: HomeBindings())
  ];
}
