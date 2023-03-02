import 'package:get/get.dart';
import 'package:swapi_app/src/data/dtos/people_dto.dart';
import 'package:swapi_app/src/data/dtos/planet_dto.dart';
import 'package:swapi_app/src/domain/entities/planet_entity.dart';
import 'package:swapi_app/src/domain/usecases/get_planet_by_url/get_planet_by_url.dart';

class DetailsController extends GetxController {
  final PeopleDto people = Get.arguments['people'] as PeopleDto;

  GetPlanetByUrlUseCase getPlanetByUrlUseCase;

  DetailsController({
    required this.getPlanetByUrlUseCase,
  });

  RxBool loadingPlanet = true.obs;

  // ignore: unnecessary_cast
  Rx<PlanetEntity?> planet = (null as PlanetDto?).obs;

  @override
  void onInit() {
    getPlanet();
    super.onInit();
  }

  Future<void> getPlanet() async {
    try {
      loadingPlanet.value = true;
      final response = await getPlanetByUrlUseCase.call(
        url: people.homeworld,
      );
      print(response);
      planet.value = response;
      loadingPlanet.value = false;
    } catch (e) {
      print(e);
      planet.value = null;
      loadingPlanet.value = false;
    }
  }
}
