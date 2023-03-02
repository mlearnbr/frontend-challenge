import 'package:get/get.dart';
import 'package:swapi_app/src/presentation/details/details_controller.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(
      () => DetailsController(),
    );
  }
}
