import 'package:get/get.dart';

import '../films/films_controller.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(FilmsController());
  }
}
