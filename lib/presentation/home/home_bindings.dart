import 'package:get/get.dart';

import '../../src/interface/interface_provider_character.dart';
import '../../src/interface/interface_repository_character.dart';
import '../../src/provider/provider_get_character.dart';
import '../../src/repository/repository_get_character.dart';
import 'home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetConnect());
    Get.lazyPut<InterfaceRepositoryCharacter>(
        () => RepositoryGetCharacter(Get.find()));
    Get.lazyPut<InterfaceProviderCharacter>(
        () => (ProviderGetCharacter(RepositoryGetCharacter(Get.find()))));
    Get.put(HomeController(Get.find()));
  }
}
