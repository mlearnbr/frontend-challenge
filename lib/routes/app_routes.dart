import 'package:get/get.dart';

import '../presentation/details/details_bindings.dart';
import '../presentation/details/details_page.dart';
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
        binding: HomeBindings()),
    GetPage(
        name: DetailsPage.routName,
        page: () => const DetailsPage(),
        binding: DetailsBindings())
  ];
}
