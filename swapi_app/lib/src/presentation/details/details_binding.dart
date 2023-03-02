import 'package:get/get.dart';
import 'package:swapi_app/shared/services/http_manager.dart';
import 'package:swapi_app/src/data/datasources/remote/movie/movie_remote_data_source.dart';
import 'package:swapi_app/src/data/datasources/remote/movie/movie_remote_data_source_impl.dart';
import 'package:swapi_app/src/data/datasources/remote/planet/planet_remote_data_source.dart';
import 'package:swapi_app/src/data/datasources/remote/planet/planet_remote_data_source_impl.dart';
import 'package:swapi_app/src/data/datasources/remote/specie/specie_remote_data_source.dart';
import 'package:swapi_app/src/data/datasources/remote/specie/specie_remote_data_source_impl.dart';
import 'package:swapi_app/src/data/repositories/movie_repository_impl.dart';
import 'package:swapi_app/src/data/repositories/planet_repository_impl.dart';
import 'package:swapi_app/src/data/repositories/species_repository_impl.dart';
import 'package:swapi_app/src/domain/repositories/movie_repository.dart';
import 'package:swapi_app/src/domain/repositories/planet_repository.dart';
import 'package:swapi_app/src/domain/repositories/species_repository.dart';
import 'package:swapi_app/src/domain/usecases/get_movie_by_url/get_movie_by_url.dart';
import 'package:swapi_app/src/domain/usecases/get_movie_by_url/get_movie_by_url_impl.dart';
import 'package:swapi_app/src/domain/usecases/get_planet_by_url/get_planet_by_url.dart';
import 'package:swapi_app/src/domain/usecases/get_planet_by_url/get_planet_by_url_impl.dart';
import 'package:swapi_app/src/domain/usecases/get_specie_by_url/get_sprecie_by_url.dart';
import 'package:swapi_app/src/domain/usecases/get_specie_by_url/get_sprecie_by_url_impl.dart';
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

    Get.lazyPut<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(
        manager: Get.find<HttpManager>(),
      ),
    );

    Get.lazyPut<MovieRepository>(
      () => MovieRepositoryImpl(
        movieRemoteDataSource: Get.find<MovieRemoteDataSource>(),
      ),
    );
    Get.lazyPut<GetMovieByUrlUseCase>(
      () => GetMovieByUrlUseCaseImpl(
        repository: Get.find<MovieRepository>(),
      ),
    );
    Get.lazyPut<SpecieRemoteDataSource>(
      () => SpecieRemoteDataSourceImpl(
        manager: Get.find<HttpManager>(),
      ),
    );

    Get.lazyPut<SpeciesRepository>(
      () => SpeciesRepositoryImpl(
        specieRemoteDataSource: Get.find<SpecieRemoteDataSource>(),
      ),
    );
    Get.lazyPut<GetSpecieByUrlUseCase>(
      () => GetSpecieByUrlUseCaseImpl(
        repository: Get.find<SpeciesRepository>(),
      ),
    );

    Get.lazyPut<DetailsController>(
      () => DetailsController(
        getPlanetByUrlUseCase: Get.find<GetPlanetByUrlUseCase>(),
        getMovieByUrlUseCase: Get.find<GetMovieByUrlUseCase>(),
        getSpecieByUrlUseCase: Get.find<GetSpecieByUrlUseCase>(),
      ),
    );
  }
}
