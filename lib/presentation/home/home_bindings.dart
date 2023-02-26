import 'package:get/get.dart';

import '../../src/interface/interface_provider_character.dart';
import '../../src/interface/interface_provider_films.dart';
import '../../src/interface/interface_repository_character.dart';
import '../../src/interface/interface_repository_films.dart';
import '../../src/provider/provider_get_character.dart';
import '../../src/provider/provider_get_filme.dart';
import '../../src/repository/repository_get_character.dart';
import '../../src/repository/repository_get_films.dart';
import 'home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetConnect());
    Get.lazyPut<InterfaceRepositoryCharacter>(
      () => RepositoryGetCharacter(
        Get.find(),
      ),
    );
    Get.lazyPut<InterfaceProviderCharacter>(
      () => (ProviderGetCharacter(
        RepositoryGetCharacter(Get.find()),
      )),
    );

    Get.lazyPut<InterfaceRepositoryFilms>(
      () => RepositoryGetFilms(
        Get.find(),
      ),
    );
    Get.lazyPut<InterfaceProviderFilms>(
      () => (ProviderGetFilms(
        RepositoryGetFilms(Get.find()),
      )),
    );

    Get.put(HomeController(
      Get.find(),
      Get.find(),
    ));
  }
}
