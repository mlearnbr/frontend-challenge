import 'package:get/get.dart';
import 'package:swapi_app/src/data/dtos/people_dto.dart';
import 'package:swapi_app/src/data/dtos/planet_dto.dart';
import 'package:swapi_app/src/domain/entities/movie_entity.dart';
import 'package:swapi_app/src/domain/entities/planet_entity.dart';
import 'package:swapi_app/src/domain/usecases/get_movie_by_url/get_movie_by_url.dart';
import 'package:swapi_app/src/domain/usecases/get_planet_by_url/get_planet_by_url.dart';

class DetailsController extends GetxController {
  final PeopleDto people = Get.arguments['people'] as PeopleDto;

  GetPlanetByUrlUseCase getPlanetByUrlUseCase;
  GetMovieByUrlUseCase getMovieByUrlUseCase;

  DetailsController({
    required this.getPlanetByUrlUseCase,
    required this.getMovieByUrlUseCase,
  });

  RxBool loadingPlanet = true.obs;
  // ignore: unnecessary_cast
  Rx<PlanetEntity?> planet = (null as PlanetDto?).obs;

  RxBool loadingMovies = true.obs;
  RxList<MovieEntity> movies = <MovieEntity>[].obs;

  @override
  void onInit() {
    getPlanet();
    getMovies();
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

  Future<void> getMovies() async {
    try {
      List<MovieEntity> moviesAux = [];
      loadingMovies.value = true;
      for (var url in people.films) {
        final response = await getMovieByUrlUseCase.call(
          url: url,
        );
        moviesAux.add(response);
      }
      movies.addAll(moviesAux);
      loadingMovies.value = false;
    } catch (e) {
      print(e);
      movies.clear();
      loadingMovies.value = false;
    }
  }
}
