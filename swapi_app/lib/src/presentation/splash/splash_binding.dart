import 'package:get/get.dart';
import 'package:swapi_app/src/presentation/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
