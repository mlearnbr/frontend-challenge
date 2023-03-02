import 'package:swapi_app/src/data/dtos/planet_dto.dart';

abstract class PlanetRemoteDataSource {
  Future<PlanetDto> getPlanet({
    required String url,
  });
}
