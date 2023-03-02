import 'package:get/get.dart';
import 'package:swapi_app/src/data/dtos/people_dto.dart';
import 'package:swapi_app/src/data/dtos/planet_dto.dart';
import 'package:swapi_app/src/domain/entities/movie_entity.dart';
import 'package:swapi_app/src/domain/entities/planet_entity.dart';
import 'package:swapi_app/src/domain/entities/specie_entity.dart';
import 'package:swapi_app/src/domain/usecases/get_movie_by_url/get_movie_by_url.dart';
import 'package:swapi_app/src/domain/usecases/get_planet_by_url/get_planet_by_url.dart';
import 'package:swapi_app/src/domain/usecases/get_specie_by_url/get_sprecie_by_url.dart';
import 'package:swapi_app/src/presentation/global_widgets/snacbars.dart';

class DetailsController extends GetxController {
  final PeopleDto people = Get.arguments['people'] as PeopleDto;

  GetPlanetByUrlUseCase getPlanetByUrlUseCase;
  GetMovieByUrlUseCase getMovieByUrlUseCase;
  GetSpecieByUrlUseCase getSpecieByUrlUseCase;

  DetailsController({
    required this.getPlanetByUrlUseCase,
    required this.getMovieByUrlUseCase,
    required this.getSpecieByUrlUseCase,
  });

  RxBool loadingPlanet = true.obs;
  // ignore: unnecessary_cast
  Rx<PlanetEntity?> planet = (null as PlanetDto?).obs;

  RxBool loadingMovies = true.obs;
  RxList<MovieEntity> movies = <MovieEntity>[].obs;

  RxBool loadingSpecies = true.obs;
  RxList<SpecieEntity> species = <SpecieEntity>[].obs;

  @override
  void onInit() {
    getPlanet();
    getMovies();
    getSpecies();
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
      Snackbars.error(
        message: 'Error fetching the planet!',
      );
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
      Snackbars.error(
        message: 'Error when searching for movies of this character!',
      );
    }
  }

  Future<void> getSpecies() async {
    try {
      List<SpecieEntity> speciesAux = [];
      loadingSpecies.value = true;
      for (var url in people.species) {
        final response = await getSpecieByUrlUseCase.call(
          url: url,
        );
        speciesAux.add(response);
      }
      species.addAll(speciesAux);
      loadingSpecies.value = false;
    } catch (e) {
      print(e);
      species.clear();
      loadingSpecies.value = false;
      Snackbars.error(
        message: 'Error fetching species!',
      );
    }
  }
}
