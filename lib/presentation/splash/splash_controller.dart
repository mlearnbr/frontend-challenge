import 'package:get/get.dart';

import '../home/home_page.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 4),
      () => Get.offNamed(HomePage.routName),
    );
    super.onInit();
  }
}
