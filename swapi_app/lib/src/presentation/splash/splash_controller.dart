import 'package:get/get.dart';
import 'package:swapi_app/shared/config/routes/app_routes.dart';

class SplashController extends GetxController {
  Future<void> loadToPage() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    Get.offNamed(
      AppRoutes.HOME,
    );
  }
}
