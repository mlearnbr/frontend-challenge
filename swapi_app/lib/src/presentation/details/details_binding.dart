import 'package:get/get.dart';
import 'package:swapi_app/shared/services/http_manager.dart';
import 'package:swapi_app/src/data/datasources/remote/planet/planet_remote_data_source.dart';
import 'package:swapi_app/src/data/datasources/remote/planet/planet_remote_data_source_impl.dart';
import 'package:swapi_app/src/data/repositories/planet_repository_impl.dart';
import 'package:swapi_app/src/domain/repositories/planet_repository.dart';
import 'package:swapi_app/src/domain/usecases/get_planet_by_url/get_planet_by_url.dart';
import 'package:swapi_app/src/domain/usecases/get_planet_by_url/get_planet_by_url_impl.dart';
import 'package:swapi_app/src/presentation/details/details_controller.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanetRemoteDataSource>(
      () => PlanetRemoteDataSourceImpl(
        manager: Get.find<HttpManager>(),
      ),
    );

    Get.lazyPut<PlanetRepository>(
      () => PlanetRepositoryImpl(
        planetRemoteDataSource: Get.find<PlanetRemoteDataSource>(),
      ),
    );
    Get.lazyPut<GetPlanetByUrlUseCase>(
      () => GetPlanetByUrlUseCaseImpl(
        repository: Get.find<PlanetRepository>(),
      ),
    );
    Get.lazyPut<DetailsController>(
      () => DetailsController(
        getPlanetByUrlUseCase: Get.find<GetPlanetByUrlUseCase>(),
      ),
    );
  }
}
