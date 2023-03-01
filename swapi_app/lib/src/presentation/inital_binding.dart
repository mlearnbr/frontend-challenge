import 'package:get/get.dart';
import 'package:swapi_app/shared/services/http_manager.dart';

class InitalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HttpManager>(
      HttpManager(),
    );
  }
}
