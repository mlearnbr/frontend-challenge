import 'package:get/get.dart';
import 'package:swapi_app/shared/config/routes/app_routes.dart';
import 'package:swapi_app/src/presentation/splash/index.dart';
import 'package:swapi_app/src/presentation/home/index.dart';

abstract class AppPages {
  static const INITIAL = AppRoutes.SPLASH;

  static final List<GetPage> pages = <GetPage>[
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
