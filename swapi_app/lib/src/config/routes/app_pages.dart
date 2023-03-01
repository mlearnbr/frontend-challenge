import 'package:get/get.dart';
import 'package:swapi_app/src/config/routes/app_routes.dart';
import 'package:swapi_app/src/presentation/splash/index.dart';
import 'package:swapi_app/src/presentation/home/index.dart';

abstract class AppPages {
  static const HOME = AppRoutes.HOME;

  static final List<GetPage> pages = <GetPage>[
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
