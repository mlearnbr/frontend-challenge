import 'package:get/get.dart';

import '../../src/interface/interface_provider.dart';
import '../../src/interface/interface_respository.dart';
import '../../src/provider/provider_get_character.dart';
import '../../src/repository/respository_get_character.dart';
import 'home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetConnect());
    Get.lazyPut<InterfaceRespository>(
        () => RespositoryGetCharacter(Get.find()));
    Get.lazyPut<InterfaceProvider>(
        () => (ProviderGetCharacter(RespositoryGetCharacter(Get.find()))));
    Get.put(HomeController(Get.find()));
  }
}
