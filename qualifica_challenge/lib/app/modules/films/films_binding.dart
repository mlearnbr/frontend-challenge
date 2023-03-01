import 'package:get/get.dart';

import 'films_controller.dart';

class FilmsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FilmsController());
  }
}
