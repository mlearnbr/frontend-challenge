import 'package:swapi_app/src/domain/entities/planet_entity.dart';

abstract class PlanetRepository {
  Future<PlanetEntity> getPlanetByUrl({
    required String url,
  });
}
